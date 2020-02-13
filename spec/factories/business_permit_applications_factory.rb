FactoryBot.define do 
  factory :business_permit_application do 
    association :applicant, factory: :taxpayer 
    association :ownership_type 
    association :locality
    association :barangay
  end 
end 