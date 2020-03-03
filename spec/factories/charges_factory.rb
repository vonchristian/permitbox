FactoryBot.define do
  factory :charge do
    association :locality
    amount { 500 }
    name { Faker::Commerce.product_name }
  end
end
