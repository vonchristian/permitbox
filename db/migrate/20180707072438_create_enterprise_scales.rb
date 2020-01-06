class CreateEnterpriseScales < ActiveRecord::Migration[5.2]
  def change
    create_table :enterprise_scales, id: :uuid do |t|
      t.decimal :min_asset_size
      t.decimal :max_asset_size
      t.string :name

      t.timestamps
    end
  end
end
