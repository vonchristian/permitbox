class AddAccountNumberToPermits < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :account_number, :string
    add_index :permits, :account_number, unique: true
  end
end
