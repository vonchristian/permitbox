class AddOfficeToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :office, foreign_key: true, type: :uuid
  end
end
