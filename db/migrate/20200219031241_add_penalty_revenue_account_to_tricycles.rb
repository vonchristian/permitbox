class AddPenaltyRevenueAccountToTricycles < ActiveRecord::Migration[6.0]
  def change
    add_reference :tricycles, :penalty_revenue_account, foreign_key: { to_table: :accounts }, type: :uuid 
  end
end
