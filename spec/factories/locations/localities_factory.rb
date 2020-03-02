FactoryBot.define do
  factory :locality, class: Locations::Locality do
    name { Faker::Address.city }
    association :business_tax_computation_config
    association :mayors_permit_fee_calculation_config
  end
end
