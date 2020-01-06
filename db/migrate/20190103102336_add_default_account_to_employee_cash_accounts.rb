class AddDefaultAccountToEmployeeCashAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :employee_cash_accounts, :locality, foreign_key: true, type: :uuid
    add_column :employee_cash_accounts, :default_account, :boolean, default: false
  end
end
