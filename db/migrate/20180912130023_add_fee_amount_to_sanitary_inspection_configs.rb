class AddFeeAmountToSanitaryInspectionConfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :sanitary_inspection_configs, :fee_amount, :decimal
  end
end
