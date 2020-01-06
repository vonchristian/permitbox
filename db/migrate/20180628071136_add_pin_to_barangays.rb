class AddPinToBarangays < ActiveRecord::Migration[5.2]
  def change
    add_column :barangays, :pin, :integer
    add_index :barangays, :pin, unique: true
  end
end
