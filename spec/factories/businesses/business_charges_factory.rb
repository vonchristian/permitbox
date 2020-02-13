FactoryBot.define do
  factory :business_charge, class: Businesses::BusinessCharge do
    association :business
    association :business_permit_application
    association :revenue_account, factory: :revenue
    association :charge 
  end
end
