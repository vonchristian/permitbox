class RemoveOfficeFromDocumentTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :document_transactions, :office, foreign_key: true, type: :uuid
  end
end
