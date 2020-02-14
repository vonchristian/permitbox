class AddTricycleFeeToTricycleCharges < ActiveRecord::Migration[6.0]
  def change
    add_reference :tricycle_charges, :tricycle_fee, foreign_key: true, type: :uuid 
  end
end
