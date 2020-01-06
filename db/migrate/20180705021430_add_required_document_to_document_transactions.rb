class AddRequiredDocumentToDocumentTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :document_transactions, :required_document, foreign_key: true, type: :uuid
  end
end
