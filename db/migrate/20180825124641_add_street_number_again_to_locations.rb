class AddStreetNumberAgainToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :street_number, :string
  end
end
