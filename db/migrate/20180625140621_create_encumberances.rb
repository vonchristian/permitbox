class CreateEncumberances < ActiveRecord::Migration[5.2]
  def change
    create_table :encumberances, id: :uuid do |t|
      t.references :encumberable, polymorphic: true, type: :uuid
      t.string :title
      t.string :description
      t.datetime :effectivity_date
      t.boolean :cancelled

      t.timestamps
    end
  end
end
