class AddAccountNumberToTricycles < ActiveRecord::Migration[5.2]
  def change
    add_column :tricycles, :account_number, :string
    add_index :tricycles, :account_number, unique: true
  end
end
