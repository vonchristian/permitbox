class AddLiabilityAccountToBarangays < ActiveRecord::Migration[5.2]
  def change
    add_column :barangays, :barangay_clearance_fee, :decimal
    add_reference :barangays, :liability_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
