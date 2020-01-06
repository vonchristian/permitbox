module Accounting
  class Amount < ApplicationRecord
    monetize :amount_cents, as: :amount, numericality: true

    belongs_to :account, class_name: "Accounting::Account"
    belongs_to :entry,   class_name: "Accounting::Entry"
    belongs_to :amountable, polymorphic: true, optional: true

    def self.for_account(args={})
      where(account_id: args[:account_id])
    end

    def self.excluding_account(args={})
      where.not(account_id: args[:account_id])
    end

    def self.cash_amount_total
      for_account(account_id: Employees::EmployeeCashAccount.cash_accounts).total
    end

    def self.total
      all.map{ |a| a.amount.amount }.sum
    end

    def self.balance(args={})
      args_with_amounts = args.merge( { amounts: self })
      balance_finder(args_with_amounts).new(args_with_amounts).compute
    end


    def self.balance_for_new_record
      balance = BigDecimal('0')
      all.each do |amount_record|
        if amount_record.amount && !amount_record.marked_for_destruction?
          balance += amount_record.amount # unless amount_record.marked_for_destruction?
        end
      end
      return balance
    end

    private
    def self.balance_finder(opts={})
      temp = opts.select{|key, value| !value.nil?}.keys.sort.map{ |key| key.to_s.titleize }.join.gsub(" ", "")
      ("Accounting::BalanceFinders::" + temp).constantize
    end
  end
end
