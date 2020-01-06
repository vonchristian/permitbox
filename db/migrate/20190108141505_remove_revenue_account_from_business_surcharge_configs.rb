class RemoveRevenueAccountFromBusinessSurchargeConfigs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :business_surcharge_configs, :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
