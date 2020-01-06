class AddChargeToSanitaryInspectionConfig < ActiveRecord::Migration[5.2]
  def change
    add_reference :sanitary_inspection_configs, :charge, foreign_key: true, type: :uuid
  end
end
