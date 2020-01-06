class CreatePrerequisites < ActiveRecord::Migration[5.2]
  def change
    create_table :prerequisites, id: :uuid do |t|
      t.belongs_to :main_document, foreign_key: { to_table: :documents }, type: :uuid
      t.belongs_to :sub_document, foreign_key: { to_table: :documents }, type: :uuid

      t.timestamps
    end
  end
end
