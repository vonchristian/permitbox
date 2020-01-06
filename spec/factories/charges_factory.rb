FactoryBot.define do
  factory :charge do
    association :locality
    association :revenue_account, factory: :revenue
    amount { 500 }
    name { Faker::Commerce.product_name }
  end
end
