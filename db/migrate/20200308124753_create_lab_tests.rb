class CreateLabTests < ActiveRecord::Migration[6.0]
  def change
    create_table :lab_tests, id: :uuid do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
