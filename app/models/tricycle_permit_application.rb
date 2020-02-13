class TricyclePermitApplication < ApplicationRecord
  include PgSearch::Model
  extend RecentApplicationFinder
  pg_search_scope :text_search, against: [:application_number, :make, :tricycle_model, :color, :plate_number],
  :associated_against => { :taxpayer => [:first_name, :middle_name, :last_name]}
  enum mode_of_payment: [:annually, :quarterly, :semi_annually]
  enum tricycle_type: [:new_tricycle, :old_tricycle]

  belongs_to :tricycle_organization
  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :tricycle, optional: true
  belongs_to :taxpayer
  has_one    :voucher,   as: :payee
  has_many :voucher_amounts, class_name: "Vouchers::VoucherAmount", as: :amountable
  has_many :tricycle_permits, class_name: "Permits::TricyclePermit", as: :permitable
  delegate :name, to: :tricycle_organization, prefix: true
  delegate :current_location_complete_address, to: :tricycle, allow_nil: true

  def self.vouchers
    Voucher.where(payee_id: self.pluck(:id))
  end

  def processed?
    voucher.present?
  end

  def name
    taxpayers_full_name
  end

  def taxpayers_full_name
    taxpayer.full_name
  end

  def make_and_model
    "#{make} #{tricycle_model}"
  end
end
