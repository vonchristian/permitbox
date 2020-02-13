class AddRevenueAccountToBusinessActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :business_activities, :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid 
  end
end
