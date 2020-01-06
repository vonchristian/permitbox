class CreateRealPropertyAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :real_property_areas, id: :uuid do |t|
      t.references :measureable, polymorphic: true, type: :uuid, index: { name: "index_measureable_on_real_property_areas" }
      t.decimal :area
      t.datetime :effectivity_date

      t.timestamps
    end
  end
end
