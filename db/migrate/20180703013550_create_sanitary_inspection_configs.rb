class CreateSanitaryInspectionConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :sanitary_inspection_configs, id: :uuid do |t|
      t.decimal :minimum_area
      t.decimal :maximum_area

      t.timestamps
    end
  end
end
