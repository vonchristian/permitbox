FactoryBot.define do 
  factory :business_permit_application do 
    association :applicant, factory: :taxpayer 
    association :cart 
    association :business
    association :ownership_type 
    association :locality
    association :barangay
    association :business_tax_category
    association :business_tax_revenue_account, factory: :revenue
    application_date { Date.current }
    application_number { SecureRandom.uuid }
    business_name             { Faker::Company.bs }
  end 
end 