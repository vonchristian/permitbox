class AddTricycleModelToTricyclePermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :tricycle_permit_applications, :tricycle_model, :string
  end
end
