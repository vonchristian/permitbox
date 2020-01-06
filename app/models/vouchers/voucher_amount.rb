module Vouchers
  class VoucherAmount < ApplicationRecord
    monetize :amount_cents, as: :amount
    enum amount_type: [:debit, :credit]
    belongs_to :cart, optional: true
    belongs_to :voucher,    optional: true
    belongs_to :account,    class_name: "Accounting::Account"

    validates :quantity, presence: true, numericality: true

    def self.without_voucher
      where(voucher_id: nil)
    end

    def self.with_voucher
      where.not(voucher_id: nil)
    end

    def self.for_account(args={})
      where(account: args.fetch(:account))
    end

    def self.excluding_account(args={})
      where.not(account: args[:account])
    end

    def self.with_non_zero_amounts
      where.not(amount_cents: 0)
    end

    def self.discount_amounts
      joins(:account).
      where('accounts.type' => 'Accounting::Revenue').
      where('accounts.contra' => true)
    end

    def self.non_discount_amounts
      joins(:account).
      where('accounts.type' => 'Accounting::Revenue').
      where('accounts.contra' => false)
    end


    def self.total
      all.map{|a| a.amount.amount }.sum
    end

    def self.total_less_discount
      non_discount_amounts.total -
      discount_amounts.total
    end
  end
end
