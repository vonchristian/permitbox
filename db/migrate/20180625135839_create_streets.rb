class CreateStreets < ActiveRecord::Migration[5.2]
  def change
    create_table :streets, id: :uuid do |t|
      t.belongs_to :barangay, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
