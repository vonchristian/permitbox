class CreateGrossSalesTaxRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :gross_sales_tax_ranges, id: :uuid do |t|
      t.belongs_to :business_tax_category, foreign_key: true, type: :uuid
      t.decimal :minimum_gross_sale
      t.decimal :maximum_gross_sale

      t.timestamps
    end
  end
end
