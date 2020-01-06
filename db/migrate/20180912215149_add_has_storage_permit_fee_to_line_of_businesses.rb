class AddHasStoragePermitFeeToLineOfBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :line_of_businesses, :has_storage_permit_fee, :boolean, default: false
  end
end
