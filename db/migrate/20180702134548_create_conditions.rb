class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions, id: :uuid do |t|
      t.belongs_to :document, foreign_key: true, type: :uuid
      t.text :content

      t.timestamps
    end
  end
end
