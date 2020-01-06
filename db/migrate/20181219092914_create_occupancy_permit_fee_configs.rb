class CreateOccupancyPermitFeeConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :occupancy_permit_fee_configs, id: :uuid do |t|
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.decimal :fee_amount

      t.timestamps
    end
  end
end
