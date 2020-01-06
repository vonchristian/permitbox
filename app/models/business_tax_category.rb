class BusinessTaxCategory < ApplicationRecord
  belongs_to :revenue_account, class_name: "Accounting::Account"
  belongs_to :discount_account, class_name: "Accounting::Account"

  belongs_to :locality, class_name: "Locations::Locality"
  has_many :gross_sales_tax_ranges, class_name: "BusinessTaxCategories::GrossSalesTaxRange"
  has_many :businesses, dependent: :nullify

  def compute_tax(gross_sale_amount)
    tax_range = gross_sales_tax_ranges.select { |a| a.range.include?(gross_sale_amount) }.first
    tax_range.tax_calculator.new(gross_sales_tax_range: tax_range, gross_sale_amount: gross_sale_amount).compute_tax
  end
end
