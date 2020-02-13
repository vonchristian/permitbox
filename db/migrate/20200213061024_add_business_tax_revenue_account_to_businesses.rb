class AddBusinessTaxRevenueAccountToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_reference :businesses, :business_tax_revenue_account,  foreign_key: { to_table: :accounts }, type: :uuid 
  end
end
