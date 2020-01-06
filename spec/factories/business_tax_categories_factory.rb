FactoryBot.define do
  factory :business_tax_category do
    association :revenue_account, factory: :revenue
    association :discount_account, factory: :revenue
    association :locality
    title { Faker::Company.bs }
  end
end
