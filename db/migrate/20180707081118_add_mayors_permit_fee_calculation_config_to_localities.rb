class AddMayorsPermitFeeCalculationConfigToLocalities < ActiveRecord::Migration[5.2]
  def change
    add_reference :localities, :mayors_permit_fee_calculation_config, foreign_key: true, type: :uuid
  end
end
