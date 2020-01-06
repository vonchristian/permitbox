class RemoveBamountFromGrossSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :gross_sales, :bamount, :decimal
    remove_column :gross_sales, :date, :datetime
  end
end
