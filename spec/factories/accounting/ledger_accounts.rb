FactoryBot.define do
  factory :ledger_account, class: Accounting::LedgerAccount do
    association :ledgerable, factory: :locality
    association :account
  end
end
