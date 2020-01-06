class CreateLocalityTaxpayers < ActiveRecord::Migration[5.2]
  def change
    create_table :locality_taxpayers, id: :uuid  do |t|
      t.belongs_to :taxpayer, foreign_key: true, type: :uuid
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
