class CreateFireSafetyInspectionConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :fire_safety_inspection_configs, id: :uuid do |t|
      t.string :accounts, array: true, default: '{}'
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.belongs_to :liability_account, foreign_key: { to_table: :accounts }, type: :uuid
      t.decimal :rate

      t.timestamps
    end
  end
end
