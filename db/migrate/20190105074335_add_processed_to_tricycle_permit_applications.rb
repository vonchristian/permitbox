class AddProcessedToTricyclePermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :tricycle_permit_applications, :processed, :boolean, default: :false
  end
end
