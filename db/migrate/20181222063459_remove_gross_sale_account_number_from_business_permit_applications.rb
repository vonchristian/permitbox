class RemoveGrossSaleAccountNumberFromBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    remove_index :business_permit_applications, :gross_sale_account_number
    remove_column :business_permit_applications, :gross_sale_account_number, :string
  end
end
