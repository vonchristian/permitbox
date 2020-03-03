FactoryBot.define do 
  factory :term do 
    association :termable, factory: :permit
    expiry_date { Date.current + 1.year }
    effectivity_date { Date.current }
  end 
end 