class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies, id: :uuid do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
