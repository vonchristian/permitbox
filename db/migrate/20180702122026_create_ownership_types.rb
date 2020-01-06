class CreateOwnershipTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :ownership_types, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
