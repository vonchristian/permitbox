class RemoveCalendarYearFromGrossSales < ActiveRecord::Migration[5.2]
  def change
    remove_column :gross_sales, :calendar_year, :datetime
  end
end
