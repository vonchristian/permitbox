class CreatePropertyIndexNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :property_index_numbers, id: :uuid do |t|
      t.references :property, polymorphic: true, type: :uuid
      t.string :number

      t.timestamps
    end
  end
end
