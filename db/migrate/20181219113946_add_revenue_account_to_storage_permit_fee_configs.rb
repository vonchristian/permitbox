class AddRevenueAccountToStoragePermitFeeConfigs < ActiveRecord::Migration[5.2]
  def change
    add_reference :storage_permit_fee_configs, :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
