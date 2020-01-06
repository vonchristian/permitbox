class RemoveUserFromBudgets < ActiveRecord::Migration[5.2]
  def change
    remove_reference :budgets, :user, foreign_key: true, type: :uuid
  end
end
