FactoryBot.define do
  factory :voucher do
    association :payee, factory: :asset
    association :locality
    association :preparer, factory: :user
    account_number { SecureRandom.uuid }
    date           { Date.current }
  end

end
