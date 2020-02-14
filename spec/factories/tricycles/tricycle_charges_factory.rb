FactoryBot.define do
  factory :tricycle_charge, class: Tricycles::TricycleCharge do
    association :tricycle
    association :tricycle_permit_application
    association :revenue_account, factory: :revenue
    association :tricycle_fee
  end
end
