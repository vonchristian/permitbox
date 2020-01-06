class CreateRealPropertySurchargeConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :real_property_surcharge_configs, id: :uuid do |t|
      t.decimal :rate
      t.datetime :effectivity_date
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.belongs_to :general_revision, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
