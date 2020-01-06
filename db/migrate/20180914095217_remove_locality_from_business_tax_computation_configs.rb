class RemoveLocalityFromBusinessTaxComputationConfigs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :business_tax_computation_configs, :locality, foreign_key: true, type: :uuid
  end
end
