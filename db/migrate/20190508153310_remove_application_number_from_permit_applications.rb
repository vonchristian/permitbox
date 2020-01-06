class RemoveApplicationNumberFromPermitApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :permit_applications, :application_number, :string
  end
end
