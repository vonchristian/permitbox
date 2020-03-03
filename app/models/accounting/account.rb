module Accounting
  class Account < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :text_search, :against => [:name, :code]
    multisearchable against: [:name, :code]

    class_attribute :normal_credit_balance
    has_many :amounts,              class_name: "Accounting::Amount"
    has_many :credit_amounts,       class_name: 'Accounting::CreditAmount'
    has_many :debit_amounts,        class_name: 'Accounting::DebitAmount'
    has_many :entries,              through: :amounts, source: :entry
    has_many :credit_entries,       :through => :credit_amounts, :source => :entry, :class_name => 'Accounting::Entry'
    has_many :debit_entries,        :through => :debit_amounts, :source => :entry, :class_name => 'Accounting::Entry'
    has_many :subsidiary_accounts,  class_name: "Accounting::Account", foreign_key: 'main_account_id'
    has_many :account_budgets,      class_name: 'Budgeting::AccountBudget'
    has_many :voucher_amounts,      class_name: 'Vouchers::VoucherAmount'
    has_many :ledger_accounts,      class_name: 'Accounting::LedgerAccount'
    validates :type, :name, :code, presence: true
    validates :name, uniqueness: true
    validates :code, uniqueness: { case_sensitive: false }

    scope :assets,      -> { where(type: 'Accounting::Asset') }
    scope :liabilities, -> { where(type: 'Accounting::Liability') }
    scope :equities,    -> { where(type: 'Accounting::Equity') }
    scope :revenues,    -> { where(type: 'Accounting::Revenue') }
    scope :expenses,    -> { where(type: 'Accounting::Expense') }



    def self.active
      where(active: true)
    end
    def self.inactive
      where.not(active: true)
    end
    def self.updated_at(args={})
      if args[:from_date] && args[:to_date]
        date_range = DateRange.new(from_date: args[:from_date], to_date: args[:to_date])
        where('last_transaction_date' => date_range.start_date..date_range.end_date)
      end
    end

    def self.updated_by(employee)
      includes(:entries).where('entries.recorder_id' => employee.id)
    end

    def account_name
      name
    end
    def normalized_type
      type.gsub("Accounting::", "")
    end

    def self.types
      ["Accounting::Asset",
       "Accounting::Equity",
       "Accounting::Liability",
       "Accounting::Expense",
       "Accounting::Revenue"]
     end

    def self.balance(options={})
      accounts_balance = BigDecimal('0')
      all.each do |account|
        if account.contra
          accounts_balance -= account.balance(options)
        else
          accounts_balance += account.balance(options)
        end
      end
      accounts_balance
    end

    def self.debits_balance(options={})
      accounts_balance = BigDecimal('0')
      all.each do |account|
        if account.contra
          accounts_balance -= account.debits_balance(options)
        else
          accounts_balance += account.debits_balance(options)
        end
      end
      accounts_balance
    end

    def self.credits_balance(options={})
      accounts_balance = BigDecimal('0')
      all.accounts.each do |account|
        if account.contra
          accounts_balance -= account.credits_balance(options)
        else
          accounts_balance += account.credits_balance(options)
        end
      end
      accounts_balance
    end

    def self.trial_balance(args={})
      if self.new.class == Accounting::Account
        assets.balance(args) - (liabilities.balance(args) + equities.balance(args) + revenues.balance(args) - expenses.balance(args))
      else
        raise(NoMethodError, "undefined method 'trial_balance'")
      end
    end

    def self.net_surplus(args={})
      revenues.balance(args) - expenses.balance(args)
    end

    def balance(options={})
      if self.class == Accounting::Account
        raise(NoMethodError, "undefined method 'balance'")
      else
        if self.normal_credit_balance ^ contra
          credits_balance(options) - debits_balance(options)
        else
          debits_balance(options) - credits_balance(options)
        end
      end
    end

    def credits_balance(args={})
      credit_amounts.balance(args)
    end

    def debits_balance(args={})
      debit_amounts.balance(args)
    end

    def current_account_budget
      account_budgets.current
    end
  end
end
