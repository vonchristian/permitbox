class AddBusinessTaxDiscountAccountToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_reference :businesses, :business_tax_discount_account, foreign_key: { to_table: :accounts }, type: :uuid 
  end
end
