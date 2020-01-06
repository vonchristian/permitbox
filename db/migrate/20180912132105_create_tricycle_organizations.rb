class CreateTricycleOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :tricycle_organizations, id: :uuid do |t|
      t.string :abbreviated_name
      t.string :name
      t.boolean :active, default: true
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
