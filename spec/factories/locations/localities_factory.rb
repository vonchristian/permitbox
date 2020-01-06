FactoryBot.define do
  factory :locality, class: Locations::Locality do
    name { Faker::Address.city }
    association :capital_tax_revenue_account,        factory: :revenue
    association :sanitary_inspection_revenue_account,factory: :revenue
    association :police_clearance_revenue_account,   factory: :revenue
    association :surcharge_revenue_account,          factory: :revenue
    association :penalty_revenue_account,            factory: :revenue
    association :zoning_revenue_account,             factory: :revenue

    association :business_tax_computation_config
    association :mayors_permit_fee_calculation_config

  end
end
