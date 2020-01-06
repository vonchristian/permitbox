class AddChargeScopeToCharges < ActiveRecord::Migration[5.2]
  def change
    add_column :charges, :charge_scope, :integer
    add_index :charges, :charge_scope
    add_column :charges, :default_charge, :boolean, default: false
  end
end
