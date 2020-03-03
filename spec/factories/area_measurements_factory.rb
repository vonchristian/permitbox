FactoryBot.define do 
  factory :area_measurement do 
    association :measurable, factory: :land 
  end 
end 