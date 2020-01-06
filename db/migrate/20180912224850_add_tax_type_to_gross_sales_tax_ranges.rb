class AddTaxTypeToGrossSalesTaxRanges < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales_tax_ranges, :tax_type, :integer
    add_index :gross_sales_tax_ranges, :tax_type
  end
end
