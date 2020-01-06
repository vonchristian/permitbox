class AddAccountNumberToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :account_number, :string
  end
end
