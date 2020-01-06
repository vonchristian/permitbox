class AddMarketVendorToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :market_vendor, :boolean, default: false
  end
end
