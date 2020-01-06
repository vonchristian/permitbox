class AddApplicationTypeToPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :permit_applications, :application_type, :integer
    add_index :permit_applications, :application_type
  end
end
