class CreatePermits < ActiveRecord::Migration[5.2]
  def change
    create_table :permits, id: :uuid do |t|
      t.references :permitable, polymorphic: true, type: :uuid
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.string :permit_number
      t.datetime :approval_date
      t.datetime :expiry_date
      t.string :type

      t.timestamps
    end
    add_index :permits, :type
  end
end
