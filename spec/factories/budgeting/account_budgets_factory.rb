FactoryBot.define do 
  factory :account_budget, class: Budgeting::AccountBudget do 
    association :account, factory: :revenue 
    association :locality
  end 
end 