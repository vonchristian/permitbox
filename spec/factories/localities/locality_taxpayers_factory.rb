FactoryBot.define do
  factory :locality_taxpayer, class: Localities::LocalityTaxpayer do
    association :taxpayer
    association :locality
    association :receivable_account, factory: :asset
  end
end
