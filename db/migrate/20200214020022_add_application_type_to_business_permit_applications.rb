class AddApplicationTypeToBusinessPermitApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :business_permit_applications, :application_type, :integer, default: 0
    add_index :business_permit_applications, :application_type
  end
end
