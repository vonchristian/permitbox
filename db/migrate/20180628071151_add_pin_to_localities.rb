class AddPinToLocalities < ActiveRecord::Migration[5.2]
  def change
    add_column :localities, :pin, :integer
    add_index :localities, :pin, unique: true
  end
end
