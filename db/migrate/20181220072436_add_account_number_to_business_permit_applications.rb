class AddAccountNumberToBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :business_permit_applications, :account_number, :string
    add_column :business_permit_applications, :gross_sale_account_number, :string

    add_index :business_permit_applications, :account_number, unique: true
    add_index :business_permit_applications, :gross_sale_account_number, unique: true

  end
end
