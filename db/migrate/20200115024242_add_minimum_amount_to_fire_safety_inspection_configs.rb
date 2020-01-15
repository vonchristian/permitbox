class AddMinimumAmountToFireSafetyInspectionConfigs < ActiveRecord::Migration[6.0]
  def change
    add_column :fire_safety_inspection_configs, :minimum_amount, :decimal, default: 0
  end
end
