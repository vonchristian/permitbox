class CreateRegistries < ActiveRecord::Migration[5.2]
  def change
    create_table :registries, id: :uuid do |t|
      t.string :type
      t.string :employee
      t.belongs_to :employee, foreign_key: { to_table: :users }, type: :uuid
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :registries, :type
  end
end
