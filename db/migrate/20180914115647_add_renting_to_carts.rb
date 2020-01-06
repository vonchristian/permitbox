class AddRentingToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :rented, :boolean, default: false
    add_column :carts, :monthly_rental, :decimal
    add_reference :carts, :public_market, foreign_key: true, type: :uuid
    add_column :carts, :market_vendor, :boolean
    add_column :carts, :tenancy_type, :integer, default: 0
  end
end
