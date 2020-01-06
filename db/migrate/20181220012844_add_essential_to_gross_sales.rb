class AddEssentialToGrossSales < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales, :essential, :boolean
  end
end
