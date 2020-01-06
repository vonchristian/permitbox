class AddAgencyToOwnershipType < ActiveRecord::Migration[5.2]
  def change
    add_reference :ownership_types, :agency, foreign_key: true, type: :uuid
  end
end
