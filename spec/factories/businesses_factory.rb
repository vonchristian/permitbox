FactoryBot.define do
  factory :business do
    association :locality
    name { Faker::Company.name }
    association :ownership_type
    association :business_tax_category
  end
end
