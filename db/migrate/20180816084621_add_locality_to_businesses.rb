class AddLocalityToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :locality, foreign_key: true, type: :uuid
  end
end
