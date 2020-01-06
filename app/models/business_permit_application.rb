class BusinessPermitApplication < ApplicationRecord
  include PgSearch
  include Discountable
  extend RecentApplicationFinder
  pg_search_scope :text_search, against: [:business_name, :application_number]
  enum mode_of_payment: [:annually, :quarterly, :semi_annually]
  enum tenancy_type: [:regular, :transient]

  belongs_to :applicant, polymorphic: true
  belongs_to :ownership_type
  belongs_to :business_tax_category
  belongs_to :business, optional: true
  belongs_to :public_market, optional: true
  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :barangay, class_name: "Locations::Barangay"
  belongs_to :street, class_name: "Locations::Street", optional: true
  has_one    :voucher,   as: :payee
  has_many   :business_permits, class_name: "Permits::BusinessPermit", as: :permitable
  has_many   :voucher_amounts, class_name: "Vouchers::VoucherAmount", as: :amountable, dependent: :destroy
  has_many   :business_activities, class_name: "Businesses::BusinessActivity", dependent: :destroy
  has_many   :line_of_businesses, through: :business_activities
  has_many   :business_tax_receivables, dependent: :destroy
  has_many   :gross_sales, class_name: "Businesses::GrossSale", dependent: :destroy

  delegate :title, to: :ownership_type, prefix: true
  delegate :title, to: :business_tax_category, prefix: true
  delegate :name, to: :barangay, prefix: true
  delegate :taxpayers_full_name, to: :business

  delegate :name, to: :public_market, prefix: true, allow_nil: true

  def current_gross_sale
    gross_sales.current
  end

  def paid?
    voucher.present? && voucher.paid?
  end

  def taxpayer_full_name
    "#{taxpayer_last_name}, #{taxpayer_first_name} #{taxpayer_middle_name}"
  end

  def taxpayers_last_and_first_name
    "#{taxpayer_last_name}, #{taxpayer_first_name} #{taxpayer_middle_name}"
  end

  def self.with_vouchers
    with_vouchers = Voucher.where(payee_id: self.pluck(:id)).pluck(:payee_id)
    where(id: with_vouchers)
  end
  def self.vouchers
    Voucher.where(payee_id: self.pluck(:id))
  end

  def name
    business_name
  end
  def business_tax
    if current_gross_sale.present?
      business_tax_category.compute_tax(current_gross_sale.amount)
    else
      0
    end
  end
  def business_tax_receivable
    business_tax - business_tax_discount
  end

  def business_tax_discount
    if voucher_amounts.where(account: business_tax_category.discount_account).present?
      voucher_amounts.where(account: business_tax_category.discount_account).total
    else
      0
    end
  end


  def payable_amount_per_schedule
    if annually?
      business_tax_receivable
    elsif quarterly?
      business_tax_receivable / 4.0
    elsif semi_annually?
      business_tax_receivable / 2.0
    end
  end
end
