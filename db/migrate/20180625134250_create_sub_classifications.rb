class CreateSubClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_classifications, id: :uuid do |t|
      t.belongs_to :classification, foreign_key: true, type: :uuid
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
