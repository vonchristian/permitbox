class AddPinToProvinces < ActiveRecord::Migration[5.2]
  def change
    add_column :provinces, :pin, :integer
    add_index :provinces, :pin, unique: true
  end
end
