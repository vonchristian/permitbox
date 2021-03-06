FactoryBot.define do 
  factory :business_activity, class: Businesses::BusinessActivity do 
    association :revenue_account, factory: :revenue 
    association :business 
    association :line_of_business
    quantity { 1 }
  end 
end 