class AddLocalityToSanitaryInspectionConfigs < ActiveRecord::Migration[5.2]
  def change
    add_reference :sanitary_inspection_configs, :locality, foreign_key: true, type: :uuid
  end
end
