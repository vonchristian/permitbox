class CreateTricycles < ActiveRecord::Migration[5.2]
  def change
    create_table :tricycles, id: :uuid do |t|
      t.string :plate_number
      t.string :mtop_number
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.belongs_to :tricycle_organization, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
