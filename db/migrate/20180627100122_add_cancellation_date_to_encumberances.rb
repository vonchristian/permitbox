class AddCancellationDateToEncumberances < ActiveRecord::Migration[5.2]
  def change
    add_column :encumberances, :cancellation_date, :datetime
  end
end
