class AddLocalityToBusinessTaxCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_tax_categories, :locality, foreign_key: true, type: :uuid
  end
end
