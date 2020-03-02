class CreateTinPlates < ActiveRecord::Migration[6.0]
  def change
    create_table :tin_plates, id: :uuid do |t|
      t.references :tin_platable, polymorphic: true, null: false, type: :uuid 
      t.string :number
      t.belongs_to :locality, null: false, foreign_key: true, type: :uuid 

      t.timestamps
    end
  end
end
