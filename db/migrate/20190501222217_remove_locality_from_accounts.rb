class RemoveLocalityFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :accounts, :locality, foreign_key: true, type: :uuid
  end
end
