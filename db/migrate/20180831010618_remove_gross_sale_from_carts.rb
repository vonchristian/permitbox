class RemoveGrossSaleFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :gross_sale, :decimal
  end
end
