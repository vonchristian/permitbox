FactoryBot.define do
  factory :amount, class: Accounting::Amount do
    amount { 100 }
    association :account
    association :entry
    factory :debit_amount, class: Accounting::DebitAmount do
      type { 'Accounting::DebitAmount' }
    end

    factory :credit_amount, class: Accounting::CreditAmount do
      type { 'Accounting::CreditAmount' }
    end
  end
end
