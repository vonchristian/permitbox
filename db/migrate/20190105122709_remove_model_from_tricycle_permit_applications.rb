class RemoveModelFromTricyclePermitApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :tricycle_permit_applications, :model, :string
  end
end
