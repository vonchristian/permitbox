class AddDescriptionToOwnershipTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :ownership_types, :description, :text
  end
end
