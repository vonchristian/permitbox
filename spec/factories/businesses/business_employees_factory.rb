FactoryBot.define do
  factory :business_employee, class: Businesses::BusinessEmployee do
    association :business 
    association :employee, factory: :taxpayer
  end
end
