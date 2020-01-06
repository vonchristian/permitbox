class CreateClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :classifications, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
