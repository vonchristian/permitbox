class RemoveProcessedFromTricyclePermitApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :tricycle_permit_applications, :processed, :boolean
  end
end
