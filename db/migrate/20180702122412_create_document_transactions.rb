class CreateDocumentTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :document_transactions, id: :uuid do |t|
      t.string :type
      t.datetime :date
      t.belongs_to :office, foreign_key: true, type: :uuid
      t.belongs_to :applicant, polymorphic: true, type: :uuid


      t.timestamps
    end
    add_index :document_transactions, :type
  end
end
