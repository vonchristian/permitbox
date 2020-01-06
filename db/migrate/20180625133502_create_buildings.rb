class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings, id: :uuid do |t|
      t.string :description

      t.timestamps
    end
  end
end
