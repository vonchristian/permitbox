class AddBusinessTaxComputationConfigToLocalities < ActiveRecord::Migration[5.2]
  def change
    add_reference :localities, :business_tax_computation_config, foreign_key: true, type: :uuid
  end
end
