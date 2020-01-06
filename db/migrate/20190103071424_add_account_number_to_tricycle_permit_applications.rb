class AddAccountNumberToTricyclePermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :tricycle_permit_applications, :account_number, :string
    add_index :tricycle_permit_applications, :account_number, unique: true
  end
end
