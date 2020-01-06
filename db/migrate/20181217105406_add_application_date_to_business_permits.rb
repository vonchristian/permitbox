class AddApplicationDateToBusinessPermits < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :application_date, :datetime
  end
end
