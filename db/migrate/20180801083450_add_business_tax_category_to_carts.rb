class AddBusinessTaxCategoryToCarts < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :business_tax_category, foreign_key: true, type: :uuid
  end
end
