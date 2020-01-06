class CreateAdjustments < ActiveRecord::Migration[5.2]
  def change
    create_table :adjustments, id: :uuid do |t|
      t.belongs_to :adjustment_factor, foreign_key: true, type: :uuid
      t.references :adjustable, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
