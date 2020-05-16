FactoryBot.define do
  factory :employment, class: Businesses::Employment do
    association :business 
    association :employee, factory: :taxpayer
  end
end
