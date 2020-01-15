class AddGrossSaleTypeToGrossSales < ActiveRecord::Migration[6.0]
  def change
    add_column :gross_sales, :gross_sale_type, :integer, default: 0
    add_index :gross_sales, :gross_sale_type
  end
end
