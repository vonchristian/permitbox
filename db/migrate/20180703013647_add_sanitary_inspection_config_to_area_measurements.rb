class AddSanitaryInspectionConfigToAreaMeasurements < ActiveRecord::Migration[5.2]
  def change
    add_reference :area_measurements, :sanitary_inspection_config, foreign_key: true, type: :uuid
  end
end
