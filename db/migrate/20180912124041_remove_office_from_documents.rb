class RemoveOfficeFromDocuments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :documents, :office, foreign_key: true, type: :uuid
  end
end
