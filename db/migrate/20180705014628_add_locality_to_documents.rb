class AddLocalityToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :locality, foreign_key: true, type: :uuid
  end
end
