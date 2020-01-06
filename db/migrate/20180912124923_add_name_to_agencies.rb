class AddNameToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :name, :string
    add_index :agencies, :name, unique: true
  end
end
