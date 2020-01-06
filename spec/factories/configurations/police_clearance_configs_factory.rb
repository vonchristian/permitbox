FactoryBot.define do
  factory :police_clearance_config, class: Configurations::PoliceClearanceConfig do
    association :revenue_account, factory: :revenue
    association :locality
    fee_amount { 50 }
  end
end
