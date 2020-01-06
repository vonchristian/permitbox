class RemoveMarketVendorFromBusinesses < ActiveRecord::Migration[5.2]
  def change
    remove_column :businesses, :market_vendor, :boolean
    remove_column :businesses, :transient_business, :boolean
  end
end
