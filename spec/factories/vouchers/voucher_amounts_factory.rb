FactoryBot.define do
  factory :voucher_amount, class: Vouchers::VoucherAmount do
    association :account, factory: :asset
    association :amountable, factory: :taxpayer
    amount      { 100 }


  end
end
