class AddLocalityToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :locality, foreign_key: true, type: :uuid
  end
end
