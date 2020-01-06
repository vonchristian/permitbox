class AddGrossSaleToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :gross_sale, :decimal
  end
end
