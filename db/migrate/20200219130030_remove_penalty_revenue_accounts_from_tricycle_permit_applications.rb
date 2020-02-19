class RemovePenaltyRevenueAccountsFromTricyclePermitApplications < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tricycle_permit_applications, :penalty_revenue_account,  foreign_key: { to_table: :accounts }, type: :uuid 
  end
end
