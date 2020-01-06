class AddAccountNumberToPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :permit_applications, :account_number, :string
    add_index :permit_applications, :account_number, unique: true
  end
end
