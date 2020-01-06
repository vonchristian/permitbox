class AddProcessedToBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :business_permit_applications, :processed, :boolean, default: false
  end
end
