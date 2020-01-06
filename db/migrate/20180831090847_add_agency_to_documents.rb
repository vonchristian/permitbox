class AddAgencyToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :agency, foreign_key: true, type: :uuid
  end
end
