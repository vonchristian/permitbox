FactoryBot.define do
  factory :tricycle do
    account_number  { SecureRandom.uuid }
    association :taxpayer
    association :penalty_revenue_account, factory: :revenue
    association :tricycle_organization
    association :locality
    association :temporary_assessment_account, factory: :asset
  end
end
