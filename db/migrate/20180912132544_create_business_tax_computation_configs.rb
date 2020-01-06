class CreateBusinessTaxComputationConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :business_tax_computation_configs, id: :uuid do |t|
      t.integer :computation_type
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.timestamps
    end
    add_index :business_tax_computation_configs, :computation_type
  end
end
