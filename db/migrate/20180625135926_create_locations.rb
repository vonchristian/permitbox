class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations, id: :uuid do |t|
      t.references :locationable, polymorphic: true, type: :uuid
      t.belongs_to :street,       foreign_key: true, type: :uuid
      t.belongs_to :barangay,     foreign_key: true, type: :uuid
      t.belongs_to :locality,     foreign_key: true,  type: :uuid
      t.belongs_to :province,     foreign_key: true,  type: :uuid

      t.timestamps
    end
  end
end
