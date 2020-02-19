FactoryBot.define do
  factory :voucher_amount, class: Vouchers::VoucherAmount do
    association :account, factory: :asset
    association :amountable, factory: :taxpayer
    amount      { 100 }

    factory :debit_voucher_amount, class: Vouchers::VoucherAmount do 
      amount_type { 'debit' }
    end 

    factory :credit_voucher_amount, class: Vouchers::VoucherAmount do 
      amount_type { 'credit' }
    end 
  end
end
