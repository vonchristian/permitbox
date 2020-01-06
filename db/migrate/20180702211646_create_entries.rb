class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries, id: :uuid do |t|
      t.datetime :date
      t.string :reference_number
      t.string :description
      t.references :commercial_document, polymorphic: true, type: :uuid, index: { name: "index_commercial_document_on_entries" }

      t.timestamps
    end
  end
end
