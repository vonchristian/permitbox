class AddAgencyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :agency, foreign_key: true, type: :uuid
  end
end
