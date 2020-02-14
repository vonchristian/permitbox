class RemoveChargeFromTricycleCharges < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tricycle_charges, :charge, null: false, foreign_key: true, type: :uuid 
  end
end
