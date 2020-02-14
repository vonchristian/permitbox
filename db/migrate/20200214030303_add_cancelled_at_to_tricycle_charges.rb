class AddCancelledAtToTricycleCharges < ActiveRecord::Migration[6.0]
  def change
    add_column :tricycle_charges, :cancelled_at, :datetime
  end
end
