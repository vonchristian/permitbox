class AddLocalityToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :locality, foreign_key: true, type: :uuid
  end
end
