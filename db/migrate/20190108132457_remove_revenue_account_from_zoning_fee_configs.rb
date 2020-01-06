class RemoveRevenueAccountFromZoningFeeConfigs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :zoning_fee_configs, :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
