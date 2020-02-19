class AddPenaltyRevenueAccountToTricyclePermitApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :tricycle_permit_applications, :penalty_revenue_account,  foreign_key: { to_table: :accounts }, type: :uuid, index: { name: 'index_penalty_rev_account_on_tric_permit_applications' }
  end
end
