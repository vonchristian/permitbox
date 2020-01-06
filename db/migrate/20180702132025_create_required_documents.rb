class CreateRequiredDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :required_documents, id: :uuid do |t|
      t.belongs_to :document, foreign_key: true, type: :uuid
      t.belongs_to :business, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
