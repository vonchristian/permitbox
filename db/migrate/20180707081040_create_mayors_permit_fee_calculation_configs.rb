class CreateMayorsPermitFeeCalculationConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :mayors_permit_fee_calculation_configs, id: :uuid do |t|
      t.integer :config_type

      t.timestamps
    end
    add_index :mayors_permit_fee_calculation_configs, :config_type
  end
end
