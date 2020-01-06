class AddApplicationTypeToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :application_type, :integer
    add_index :carts, :application_type
  end
end
