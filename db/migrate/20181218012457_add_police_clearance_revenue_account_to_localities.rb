class AddPoliceClearanceRevenueAccountToLocalities < ActiveRecord::Migration[5.2]
  def change
    add_reference :localities, :police_clearance_revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
