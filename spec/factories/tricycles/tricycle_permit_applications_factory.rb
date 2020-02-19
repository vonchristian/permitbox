FactoryBot.define do 
  factory :tricycle_permit_application, class: Tricycles::TricyclePermitApplication do 
    association :tricycle
    association :taxpayer
    association :tricycle_organization 
    association :locality
    association :penalty_revenue_account, factory: :revenue
  end 
end 