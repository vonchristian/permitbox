class AddNameToStreets < ActiveRecord::Migration[5.2]
  def change
    add_column :streets, :name, :string
  end
end
