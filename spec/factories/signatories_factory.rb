FactoryBot.define do 
  factory :signatory do 
    association :locality 
    full_name { Faker::Name.name }
    designation { Faker::Company.bs }
  end 
end 
