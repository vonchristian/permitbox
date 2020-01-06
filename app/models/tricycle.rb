class Tricycle < ApplicationRecord
  include PgSearch
  enum tricycle_type: [:new_tricycle, :old_tricycle]

  extend LocalityScoping #for_locality
  include Discountable
  pg_search_scope :text_search, against: [:make, :tricycle_model, :plate_number, :mtop_number]
  has_one_attached :avatar

  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :tricycle_organization
  belongs_to :temporary_assessment_account, class_name: 'Accounting::Account', optional: true
  has_many :ownerships, as: :ownable
  has_many :taxpayer_owners, through: :ownerships, source: :owner, source_type: "Taxpayer"
  has_many :chargeables, as: :chargeable
  has_many :charges, through: :chargeables
  has_many :vouchers, through: :voucher_amounts
  has_many :tricycle_permit_applications, class_name: "PermitApplications::TricyclePermitApplication", as: :permitable
  has_many :tricycle_permits, through: :tricycle_permit_applications, class_name: "Permits::TricyclePermit"
  has_many :permit_applications, class_name: 'PermitApplications::TricyclePermitApplication', as: :permitable
  before_save :set_default_avatar

  delegate :name, :abbreviated_name, to: :tricycle_organization, prefix: true, allow_nil: true
  delegate :voucher_amounts, to: :temporary_assessment_account, allow_nil: true
  delegate :complete_address, to: :current_location, prefix: true, allow_nil: true
  def self.with_permits(args={})
    from_date = args[:from_date]
    to_date   = args[:to_date]
    date_range = DateRange.new(from_date: from_date, to_date: to_date)
    ids = joins(:tricycle_permits).
    where('permits.approval_date' => date_range.start_date..date_range.end_date).pluck(:permitable_id)
    tricycle_ids = TricyclePermitApplication.where(id: ids).pluck(:tricycle_id)
    where(id: tricycle_ids)
  end

  def self.without_permits(args={})
    with_permits = with_permits(args).pluck(:id)
    where.not(id: with_permits)
  end

  def current_location
    locations.current
  end

  def all_vouchers
    if voucher_amounts.present?
    ids = voucher_amounts.pluck(:voucher_id)
    Voucher.where(id: ids)
    end
  end
  
  def permit_application_vouchers
    tricycle_permit_applications.vouchers
  end

  def name
    "#{make_and_model} #{tricycle_organization.abbreviated_name}"
  end
  def make_and_model
    "#{make} #{tricycle_model}"
  end

  def taxpayers_full_name
    taxpayer_owners.map{|a| a.full_name }.join("/")
  end

  private
  def set_default_avatar
    if avatar.attachment.blank?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'business_logo_placeholder.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end
end
