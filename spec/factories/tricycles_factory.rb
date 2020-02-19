FactoryBot.define do
  factory :tricycle do
    association :taxpayer
    association :penalty_revenue_account, factory: :revenue
    association :tricycle_organization
    association :locality
    association :temporary_assessment_account, factory: :asset
  end
end
