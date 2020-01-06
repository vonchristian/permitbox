class CreateRealPropertyClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :real_property_classifications, id: :uuid do |t|
      t.belongs_to :classification, foreign_key: true, type: :uuid, index: { name: "index_real_property_classifications"}
      t.references :classifiable, polymorphic: true, type: :uuid, index: { name: "index_classifiable_on_real_property_classifications"}

      t.timestamps
    end
  end
end
