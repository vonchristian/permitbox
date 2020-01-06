class AddChargeToGrossSalesTaxRanges < ActiveRecord::Migration[5.2]
  def change
    add_reference :gross_sales_tax_ranges, :charge, foreign_key: true, type: :uuid
  end
end
