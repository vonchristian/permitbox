class RemoveAgencyFromDocuments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :documents, :agency, foreign_key: true, type: :uuid
  end
end
