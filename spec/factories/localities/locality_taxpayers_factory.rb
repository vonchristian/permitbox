FactoryBot.define do
  factory :locality_taxpayer, class: Localities::LocalityTaxpayer do
    association :taxpayer
    association :locality
  end
end
