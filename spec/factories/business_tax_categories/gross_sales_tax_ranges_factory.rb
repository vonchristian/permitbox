FactoryBot.define do
  factory :gross_sales_tax_range, class: BusinessTaxCategories::GrossSalesTaxRange do
    association :locality
    association :business_tax_category
    tax_type  { 'amount' }
  end
end
