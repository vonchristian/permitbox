class Tricycle < ApplicationRecord
  include PgSearch::Model
  enum tricycle_type: [:new_tricycle, :old_tricycle]

  extend LocalityScoping #for_locality

  pg_search_scope :text_search, against: [:make, :tricycle_model, :plate_number, :mtop_number]
  delegate :avatar, to: :taxpayer
  
  belongs_to :penalty_revenue_account, class_name: 'Accounting::Account'
  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :taxpayer
  belongs_to :tricycle_organization
  belongs_to :temporary_assessment_account, class_name: 'Accounting::Account', optional: true
  
  has_many :tricycle_charges, class_name: 'Tricycles::TricycleCharge'
  has_many :charges, through: :tricycle_charges
  has_many :vouchers, through: :voucher_amounts
  has_many :tricycle_permit_applications, class_name: "Tricycles::TricyclePermitApplication"
  has_many :tricycle_permits, through: :tricycle_permit_applications, class_name: "Permits::TricyclePermit"
  has_many :permit_applications, class_name: 'PermitApplications::TricyclePermitApplication', as: :permitable
  before_save :set_default_avatar

  delegate :name, :abbreviated_name, to: :tricycle_organization, prefix: true, allow_nil: true
  delegate :voucher_amounts, to: :temporary_assessment_account, allow_nil: true
  delegate :complete_address, to: :current_location, prefix: true, allow_nil: true
  delegate :full_name, to: :taxpayer, prefix: true
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
    account_ids = tricycle_charges.pluck(:revenue_account_id)
    voucher_ids = Vouchers::VoucherAmount.where(account_id: account_ids).pluck(:voucher_id)
   
    Voucher.where(id: voucher_ids.compact.flatten.uniq)
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
    taxpayer.full_name
  end

  private
  def set_default_avatar
    if avatar.attachment.blank?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'business_logo_placeholder.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end
end
