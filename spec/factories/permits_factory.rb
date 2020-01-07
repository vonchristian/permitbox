FactoryBot.define do 
  factory :permit do 
    association :permitable, factory: :business 
    association :locality
    expiry_date { Date.current.end_of_year }
    approval_date { Date.current.beginning_of_month }
    permit_number { SecureRandom.uuid }
  end 
end 