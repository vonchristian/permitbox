class CreatePropertyRevisions < ActiveRecord::Migration[5.2]
  def change
    create_table :property_revisions, id: :uuid do |t|
      t.belongs_to :general_revision, foreign_key: true, type: :uuid
      t.references :property, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
