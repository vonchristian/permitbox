module Employees
  class EmployeeCashAccount < ApplicationRecord
    belongs_to :employee, class_name: "User"
    belongs_to :cash_account, class_name: "Accounting::Account"
    def self.cash_accounts
      ids = pluck(:cash_account_id)
      Accounting::Account.where(id: ids)
    end
    
    def self.recent
     order(created_at: :desc).first
    end

    def self.default_accounts
      where(default_account: true)
    end
    def self.default_cash_account
      default_accounts.recent.cash_account
    end

  end
end
