FactoryBot.define do
  factory :line_of_business_category do
    title { Faker::Company.bs }
    association :locality
    association :revenue_account, factory: :revenue
  end
end
