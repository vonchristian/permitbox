class AddLocalityToLands < ActiveRecord::Migration[5.2]
  def change
    add_reference :lands, :locality, foreign_key: true, type: :uuid
  end
end
