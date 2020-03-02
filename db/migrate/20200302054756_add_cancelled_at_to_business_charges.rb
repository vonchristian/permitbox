class AddCancelledAtToBusinessCharges < ActiveRecord::Migration[6.0]
  def change
    add_column :business_charges, :cancelled_at, :datetime
  end
end
