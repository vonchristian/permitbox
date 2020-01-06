class CreateTricyclePermitApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :tricycle_permit_applications, id: :uuid do |t|
      t.string :mtop_number
      t.string :plate_number
      t.string :make
      t.string :model
      t.string :color
      t.belongs_to :tricycle_organization, foreign_key: true, type: :uuid
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.belongs_to :taxpayer, foreign_key: true, type: :uuid
      t.string :complete_address
      t.belongs_to :street, foreign_key: true, type: :uuid
      t.belongs_to :barangay, foreign_key: true, type: :uuid
      t.integer :tricycle_type
      t.belongs_to :tricycle, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :tricycle_permit_applications, :tricycle_type
  end
end
