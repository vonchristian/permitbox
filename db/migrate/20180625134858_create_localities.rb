class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities, id: :uuid do |t|
      t.integer :locality_type
      t.string :name

      t.timestamps
    end
    add_index :localities, :locality_type
  end
end
