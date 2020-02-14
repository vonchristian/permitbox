class AddApplicationTypeToTricyclePermitApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :tricycle_permit_applications, :application_type, :integer, default: 0
    add_index :tricycle_permit_applications, :application_type
  end
end
