class AddGrossLimitToGrossSalesTaxRanges < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales_tax_ranges, :gross_limit, :decimal
  end
end
