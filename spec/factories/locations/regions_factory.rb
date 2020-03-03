FactoryBot.define do 
  factory :region, class: Locations::Region do 
    name { Faker::Address.city }
  end 
end 