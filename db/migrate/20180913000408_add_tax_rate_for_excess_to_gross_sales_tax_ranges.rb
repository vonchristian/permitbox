class AddTaxRateForExcessToGrossSalesTaxRanges < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales_tax_ranges, :tax_rate_for_excess, :decimal
  end
end
