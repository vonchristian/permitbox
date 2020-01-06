class CreatePropertyAdministrations < ActiveRecord::Migration[5.2]
  def change
    create_table :property_administrations, id: :uuid do |t|
      t.references :administrator, polymorphic: true, type: :uuid, index: { name: "index_administrator_on_property_administrations"}
      t.references :property, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
