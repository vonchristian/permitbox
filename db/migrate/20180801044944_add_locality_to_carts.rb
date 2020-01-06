class AddLocalityToCarts < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :locality, foreign_key: true, type: :uuid
  end
end
