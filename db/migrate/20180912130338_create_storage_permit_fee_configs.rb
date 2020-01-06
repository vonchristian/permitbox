class CreateStoragePermitFeeConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :storage_permit_fee_configs, id: :uuid do |t|
      t.decimal :minimum_volume
      t.decimal :maximum_volume
      t.decimal :fee_amount
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
