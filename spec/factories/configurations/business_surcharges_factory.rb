FactoryBot.define do 
  factory :business_surcharge_config, class: Configurations::BusinessSurchargeConfig do 
    association :locality
    rate { 0.02 }
    effectivity_date { Date.current }
  end 
end 