class AddAccountNumberToTaxpayers < ActiveRecord::Migration[5.2]
  def change
    add_column :taxpayers, :account_number, :string
    add_index :taxpayers, :account_number, unique: true
  end
end
