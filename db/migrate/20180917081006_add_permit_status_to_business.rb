class AddPermitStatusToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :permit_status, :integer
    add_index :businesses, :permit_status
  end
end
