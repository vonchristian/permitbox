class AddAccountNumberToGrossSales < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales, :account_number, :string
    add_index :gross_sales, :account_number, unique: true
  end
end
