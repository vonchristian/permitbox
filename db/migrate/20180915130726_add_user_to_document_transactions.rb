class AddUserToDocumentTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :document_transactions, :user, foreign_key: true, type: :uuid
  end
end
