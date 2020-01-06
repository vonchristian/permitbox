class CreateGeneralRevisions < ActiveRecord::Migration[5.2]
  def change
    create_table :general_revisions, id: :uuid do |t|
      t.date :effectivity_year
      t.string :title

      t.timestamps
    end
  end
end
