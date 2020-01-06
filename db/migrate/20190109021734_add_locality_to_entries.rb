class AddLocalityToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :locality, foreign_key: true, type: :uuid
  end
end
