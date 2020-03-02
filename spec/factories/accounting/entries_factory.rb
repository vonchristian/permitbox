FactoryBot.define do 
  factory :entry, class: Accounting::Entry do 
    association :recorder 
  end 
end 