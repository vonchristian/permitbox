class CreateAssetSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :asset_sizes, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.belongs_to :enterprise_scale, foreign_key: true, type: :uuid
      t.decimal :asset_size
      t.datetime :date

      t.timestamps
    end
  end
end
