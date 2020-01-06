class AddRevenueAccountToSanitaryInspectionConfigs < ActiveRecord::Migration[5.2]
  def change
    add_reference :sanitary_inspection_configs, :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
