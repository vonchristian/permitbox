class AddDiscountAccountToBusinessTaxCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_tax_categories, :discount_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
