class AddModeOfPaymentToTricyclePermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :tricycle_permit_applications, :mode_of_payment, :integer
    add_index :tricycle_permit_applications, :mode_of_payment
  end
end
