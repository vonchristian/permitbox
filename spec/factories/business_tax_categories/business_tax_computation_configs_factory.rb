FactoryBot.define do
  factory :business_tax_computation_config, class: Configurations::BusinessTaxComputationConfig do
    computation_type { 'based_on_gross_sales' }
  end
end 
