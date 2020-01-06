class AddMinimumTaxAmountToGrossSalesTaxRanges < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales_tax_ranges, :minimum_tax_amount, :decimal
    add_column :gross_sales_tax_ranges, :tax_rate, :decimal

  end
end
