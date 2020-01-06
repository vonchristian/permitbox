class RemoveModelFromTricycles < ActiveRecord::Migration[5.2]
  def change
    remove_column :tricycles, :model, :string
  end
end
