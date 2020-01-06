class AddNumberOfEmployeeCountToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :employee_count, :decimal
  end
end
