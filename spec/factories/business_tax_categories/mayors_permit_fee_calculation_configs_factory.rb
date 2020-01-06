FactoryBot.define do
  factory :mayors_permit_fee_calculation_config, class: Configurations::MayorsPermitFeeCalculationConfig do
    config_type { 'per_line_of_business' }
  end
end
