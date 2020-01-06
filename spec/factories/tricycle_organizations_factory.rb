FactoryBot.define do
  factory :tricycle_organization do
    association :locality
    name { Faker::Company.name }
    abbreviated_name { Faker::Company.name }    
  end
end
