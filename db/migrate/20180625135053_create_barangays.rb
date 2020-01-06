class CreateBarangays < ActiveRecord::Migration[5.2]
  def change
    create_table :barangays, id: :uuid do |t|
      t.string :name
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
