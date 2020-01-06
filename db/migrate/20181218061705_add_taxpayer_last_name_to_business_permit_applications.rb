class AddTaxpayerLastNameToBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :business_permit_applications, :taxpayer_first_name, :string
    add_column :business_permit_applications, :taxpayer_middle_name, :string
    add_column :business_permit_applications, :taxpayer_last_name, :string
  end
end
