class CreateBusinessTaxCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :business_tax_categories, id: :uuid do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
