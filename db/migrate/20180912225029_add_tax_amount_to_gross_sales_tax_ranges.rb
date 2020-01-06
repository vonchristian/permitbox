class AddTaxAmountToGrossSalesTaxRanges < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales_tax_ranges, :tax_amount, :decimal
  end
end
