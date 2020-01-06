class RemoveProcessedFromBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :business_permit_applications, :processed, :boolean
  end
end
