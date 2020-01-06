class AddRevenueAccountToCharges < ActiveRecord::Migration[5.2]
  def change
    add_reference :charges, :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
