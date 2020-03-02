FactoryBot.define do
  factory :business_fee do
    charge_scope { 1 }
    name { "MyString" }
    amount { "9.99" }
    locality { nil }
  end
end
