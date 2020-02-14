FactoryBot.define do 
  factory :tricycle_permit_application do 
    association :tricycle
    association :taxpayer
    association :tricycle_organization 
    association :locality
  end 
end 