class AddTradeNameToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :trade_name, :string
  end
end
