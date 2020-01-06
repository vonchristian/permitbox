class Voucher < ApplicationRecord
  include PgSearch
  pg_search_scope :text_search, against: [:description, :reference_number, :token]
  has_secure_token
  belongs_to :payee,         polymorphic: true
  belongs_to :locality,      class_name: "Locations::Locality"
  belongs_to :entry,         class_name: "Accounting::Entry", optional: true
  belongs_to :preparer,      class_name: "User", foreign_key: 'preparer_id'
  has_many :voucher_amounts, class_name: "Vouchers::VoucherAmount", dependent: :destroy

  validates :account_number, presence: true, uniqueness: true

  delegate :name, to: :payee, allow_nil: true
  delegate :full_name, :designation, to: :preparer, prefix: true

  def self.recent
    order(created_at: :desc).first
  end

  def self.oldest
    order(date: :desc).last
  end

  def self.business_permit_application_vouchers
    where(payee_type: "BusinessPermitApplication")
  end

  def self.for_current_year
    entered_on(from_date: Date.current.beginning_of_year, to_date: Date.current.end_of_year).oldest
  end

  def self.entered_on(args={})
    if args[:from_date] && args[:to_date]
      date_range = DateRange.new(from_date: args[:from_date], to_date: args[:to_date])
      where('date' => date_range.start_date..date_range.end_date)
    end
  end

  def self.with_entry
    where.not(entry_id: nil)
  end

  def paid?
    with_entry?
  end

  def disbursed?
    with_entry?
  end

  def with_entry?
    entry_id.present?
  end

  def without_entry?
    entry_id.blank?
  end

  def unpaid?
    without_entry?
  end

  def total
    voucher_amounts.total
  end
end
