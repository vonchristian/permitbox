class Business < ApplicationRecord
  include PgSearch
  include Locationable
  include Discountable
  extend LocalityScoping #finding businesses that belong to a locality
  multisearchable :against => [:name]
  pg_search_scope :text_search, :against => :name

  has_one_attached :logo

  enum business_type: [:new_business, :old_business]
  enum mode_of_payment: [:annually, :quarterly, :semi_annually]
  # belongs_to :receivable_account,         class_name: 'Accounting::Account'
  belongs_to :locality,                   class_name: "Locations::Locality"
  belongs_to :ownership_type
  belongs_to :business_tax_category
  has_one :business_capital,              class_name: "Businesses::BusinessCapital"
  has_many :establishments,               class_name: "Businesses::Establishment", dependent: :destroy
  has_many :tenancies,                    as: :tenant, dependent: :destroy
  has_many :ownerships,                   as: :ownable, dependent: :destroy
  has_many :taxpayer_owners,              through: :ownerships, source: :owner, source_type: "Taxpayer"
  has_many :gross_sales,                  class_name: "Businesses::GrossSale", dependent: :destroy
  has_many :document_transactions,        as: :applicant, dependent: :destroy
  has_many :required_documents,           class_name: "Businesses::RequiredDocument", dependent: :destroy
  has_many :documents,                    through: :required_documents
  has_many :business_activities,          class_name: "Businesses::BusinessActivity", dependent: :destroy
  has_many :line_of_businesses,           through: :business_activities
  has_many :line_of_business_categories,  through: :line_of_businesses
  has_many :tin_plates,                   class_name: "Businesses::TinPlate", dependent: :destroy
  has_many :amounts,                      class_name: "Accounting::Amount", as: :amountable ,dependent: :nullify
  has_many :entries,                      class_name: "Accounting::Entry", through: :amounts
  has_many :voucher_amounts,              class_name: "Vouchers::VoucherAmount", as: :amountable, dependent: :destroy
  has_many :vouchers,                     as: :payee, dependent: :destroy
  has_many :asset_sizes,                  class_name: "Businesses::AssetSize"
  has_many :employee_counts,              dependent: :destroy
  has_many :business_permit_applications, dependent: :destroy
  has_many :business_permits,             through: :business_permit_applications
  has_many :business_tax_receivables,     dependent: :destroy

  validates :name, presence: true, uniqueness: true

  delegate :title, to: :business_tax_category, prefix: true, allow_nil: true
  delegate :enterprise_scale, to: :current_asset_size, allow_nil: true
  delegate :title, to: :ownership_type, prefix: true
  delegate :province, to: :locality
  delegate :area, to: :recent_establishment, prefix: true, allow_nil: true
  delegate :total_count, to: :recent_employee_count, prefix: true, allow_nil: true

  before_save :set_default_logo
  def self.closed
    where.not(closed_at: nil)
  end

  def self.closed_on(args={})
    from_date = args[:from_date]
    to_date   = args[:to_date]
    date_range = DateRange.new(from_date: from_date, to_date: to_date)
    closed.where('closed_at' => date_range.range)
  end

  def self.regular_tenants
    ids = Tenancy.regular.pluck(:tenant_id)
  end

  def self.with_permits(args={})
    from_date = args[:from_date]
    to_date   = args[:to_date]
    date_range = DateRange.new(from_date: from_date, to_date: to_date)
    joins(:business_permits).where('permits.approval_date' => date_range.range)
  end

  def self.without_permits(args={})
    from_date = args[:from_date]
    to_date   = args[:to_date]
    ids = with_permits(from_date: from_date, to_date: to_date).pluck(:id)
    where.not(id: ids)
  end

  def all_vouchers
    vouchers + business_permit_application_vouchers
  end
  def taxpayer_genders
    taxpayer_owners.map{|a| a.sex}.join("/")
  end
  def business_permit_application_vouchers
    business_permit_applications.vouchers
  end

  def business_tax
    if current_gross_sale.present?
      business_tax_category.compute_tax(current_gross_sale.amount)
    else
      0
    end
  end

  def current_gross_sale
    gross_sales.current
  end


  def avatar
    logo
  end

  def taxpayers_full_name
    taxpayer_owners.map{|a| a.full_name }.join("/")
  end
  def taxpayers_last_and_first_name
    taxpayer_owners.map{|a| a.last_and_first_name }.join("/")
  end

  def payments
    entries
  end


  def current_asset_size
    asset_sizes.current
  end

  def recent_employee_count
    employee_counts.recent
  end

  def recent_establishment
    establishments.recent
  end

  def business_type_text
    if old_business?
      "Renew"
    else
      "New"
    end
  end
  def business_permit_status(args={})
    business_permit = business_permits.approved_at(from_date: args[:from_date], to_date: args[:to_date]).last
    if business_permit.present?
      business_permit.permit_type
    else
      'No Permit'
    end
  end
  def badge_color(args={})
    business_permit = business_permits.approved_at(from_date: args[:from_date], to_date: args[:to_date]).last
    if business_permit.present?
      'success'
    else
      'danger'
    end
  end

  def closed?
    closed_at.present?
  end

  private
  def set_default_logo
    if !logo.attached?
      self.logo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')), filename: 'default-avatar.png', content_type: 'image/png')
    end
  end
end
