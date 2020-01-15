class CreateBusinessNames < ActiveRecord::Migration[6.0]
  def change
    create_table :business_names, id: :uuid do |t|
      t.belongs_to :business, null: false, foreign_key: true, type: :uuid 
      t.string :name

      t.timestamps
    end
  end
end
