FactoryBot.define do
  factory :business_name, class: Businesses::BusinessName do
    association :business
    name        { Faker::Company.bs }
  end
end
