class RemoveLiabilityAccountFromCharges < ActiveRecord::Migration[5.2]
  def change
    remove_reference :charges, :liability_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
