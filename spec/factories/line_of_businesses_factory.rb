FactoryBot.define do
  factory :line_of_business do
    association :locality
    association :line_of_business_category
    association :competetive_index_category
    name { Faker::Company.bs }
  end
end
