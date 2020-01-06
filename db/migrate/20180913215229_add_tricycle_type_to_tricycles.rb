class AddTricycleTypeToTricycles < ActiveRecord::Migration[5.2]
  def change
    add_column :tricycles, :tricycle_type, :integer
    add_index :tricycles, :tricycle_type
  end
end
