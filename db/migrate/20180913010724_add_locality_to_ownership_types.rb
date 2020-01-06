class AddLocalityToOwnershipTypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :ownership_types, :locality, foreign_key: true, type: :uuid
  end
end
