class AddCalendarYearToGrossSales < ActiveRecord::Migration[5.2]
  def change
    add_column :gross_sales, :calendar_year, :integer
  end
end
