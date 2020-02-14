class AddNameToPermit < ActiveRecord::Migration[6.0]
  def change
    add_column :permits, :name, :string
  end
end
