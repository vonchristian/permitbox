class RemoveStreetNumberFromLocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :street_number, :integer
  end
end
