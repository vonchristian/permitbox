class AddPlateNumberToPermits < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :plate_number, :string
  end
end
