class RemoveEssentialFromGrossSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :gross_sales, :essential, :boolean
  end
end
