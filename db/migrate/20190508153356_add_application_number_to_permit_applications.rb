class AddApplicationNumberToPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :permit_applications, :application_number, :string
  end
end
