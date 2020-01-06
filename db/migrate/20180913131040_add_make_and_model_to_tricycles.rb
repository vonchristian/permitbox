class AddMakeAndModelToTricycles < ActiveRecord::Migration[5.2]
  def change
    add_column :tricycles, :make, :string
    add_column :tricycles, :model, :string
    add_column :tricycles, :color, :string
  end
end
