class CreateFireSafetyInspectionAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :fire_safety_inspection_accounts, id: :uuid do |t|
      t.belongs_to :fire_safety_inspection_config, null: false, foreign_key: true, type: :uuid, index: { name: 'index_fire_safety_config_on_fire_safety_config_accounts' }
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid 

      t.timestamps
    end
  end
end
