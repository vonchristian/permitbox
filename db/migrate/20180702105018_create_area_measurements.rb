class CreateAreaMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :area_measurements, id: :uuid do |t|
      t.references :measurable, polymorphic: true, type: :uuid
      t.decimal :area
      t.datetime :date

      t.timestamps
    end
  end
end
