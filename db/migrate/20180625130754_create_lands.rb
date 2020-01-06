class CreateLands < ActiveRecord::Migration[5.2]
  def change
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :lands, id: :uuid do |t|
      t.string :north_boundary
      t.string :south_boundary
      t.string :east_boundary
      t.string :west_boundary

      t.timestamps
    end
  end
end
