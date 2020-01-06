class CreateRealPropertySubClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :real_property_sub_classifications, id: :uuid do |t|
      t.belongs_to :classification, foreign_key: true, type: :uuid, index: { name: "index_real_property_sub_classifications"}
      t.references :sub_classifiable, polymorphic: true, type: :uuid, index: { name: "index_sub_classifiable_on_real_property_classifications"}

      t.timestamps
    end
  end
end
