class RemoveChargeFromSanitaryInspectionConfigs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sanitary_inspection_configs, :charge, foreign_key: true, type: :uuid
    remove_reference :sanitary_inspection_configs, :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
