FactoryBot.define do
  factory :ownership_type do
    association :locality
    title { Faker::Company.bs }
  end
end 
