class AddIssuingOfficeToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :issuing_office, polymorphic: true, type: :uuid
  end
end
