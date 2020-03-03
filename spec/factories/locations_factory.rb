FactoryBot.define do 
  factory :location do 
    association      :locationable, factory: :taxpayer
    association      :street 
    association      :barangay
    association      :locality
    association      :province 
    complete_address { Faker::Address.full_address }
  end 
end 