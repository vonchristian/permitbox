class AddLocalityToOffices < ActiveRecord::Migration[5.2]
  def change
    add_reference :offices, :locality, foreign_key: true, type: :uuid
  end
end
