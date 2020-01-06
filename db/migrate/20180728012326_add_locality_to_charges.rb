class AddLocalityToCharges < ActiveRecord::Migration[5.2]
  def change
    add_reference :charges, :locality, foreign_key: true, type: :uuid
  end
end
