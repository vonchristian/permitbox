class AddAmountToGrossSales < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales, :amount, :decimal
    add_column :gross_sales, :calendar_year, :datetime
  end
end
