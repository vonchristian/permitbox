FactoryBot.define do
  factory :tricycle do
    association :tricycle_organization
    association :locality
    association :temporary_assessment_account, factory: :asset
  end
end
