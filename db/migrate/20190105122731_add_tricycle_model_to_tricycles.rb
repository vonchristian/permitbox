class AddTricycleModelToTricycles < ActiveRecord::Migration[5.2]
  def change
    add_column :tricycles, :tricycle_model, :string
  end
end
