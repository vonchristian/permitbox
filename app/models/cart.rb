class Cart < ApplicationRecord
  include Locationable
  enum application_type: [:new_business, :old_business]
  enum status: [:reviewing, :assessed]
  belongs_to :taxpayer, optional: true
  belongs_to :user, optional: true
  belongs_to :ownership_type, optional: true
  belongs_to :business_tax_category, optional: true
  belongs_to :locality, optional: true, class_name: "Locations::Locality"
  has_many :line_of_businesses, dependent: :nullify
  has_many :required_documents, class_name: "Businesses::RequiredDocument", dependent: :nullify
  has_many :documents, through: :required_documents
  has_many :chargeables, as: :chargeable, dependent: :destroy
  has_many :charges, through: :chargeables
  has_many :voucher_amounts, class_name: "Vouchers::VoucherAmount"
  has_many :area_measurements, as: :measurable, dependent: :destroy
  has_many :gross_sales, as: :grossable, class_name: "Businesses::GrossSale"
  delegate :title, to: :ownership_type, prefix: true, allow_nil: true
  delegate :title, to: :business_tax_category, prefix: true, allow_nil: true
  delegate :amount, :calendar_year, to: :current_gross_sale, prefix: true, allow_nil: true

  def current_area_measurement
    area_measurements.current
  end
  def current_gross_sale
    gross_sales.current
  end
end
