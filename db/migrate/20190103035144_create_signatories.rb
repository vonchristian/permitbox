class CreateSignatories < ActiveRecord::Migration[5.2]
  def change
    create_table :signatories, id: :uuid do |t|
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.string :designation
      t.string :full_name

      t.timestamps
    end
  end
end
