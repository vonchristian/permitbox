FactoryBot.define do
  factory :business do
    association :locality
    name { Faker::Company.name }
    account_number { SecureRandom.uuid }
    association :ownership_type
    association :business_tax_category
    association :tax_revenue_account,     factory: :revenue 
    association :tax_discount_account,    factory: :contra_revenue 
    association :penalty_revenue_account, factory: :revenue 

  end
end
