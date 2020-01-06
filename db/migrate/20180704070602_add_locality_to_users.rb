class AddLocalityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :locality, foreign_key: true, type: :uuid
  end
end
