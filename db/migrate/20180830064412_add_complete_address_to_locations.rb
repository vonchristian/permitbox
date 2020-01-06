class AddCompleteAddressToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :complete_address, :string
  end
end
