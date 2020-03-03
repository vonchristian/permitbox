class CreateLocalityClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :locality_classifications, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
