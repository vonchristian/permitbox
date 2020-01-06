class AddSurchargeRevenueAccountToLocalities < ActiveRecord::Migration[5.2]
  def change
    add_reference :localities, :surcharge_revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
