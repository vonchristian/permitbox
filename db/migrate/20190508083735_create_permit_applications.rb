class CreatePermitApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :permit_applications, id: :uuid do |t|
      t.references :applicant, polymorphic: true, type: :uuid 
      t.datetime :application_date
      t.string :application_number

      t.timestamps
    end
    add_index :permit_applications, :application_number, unique: true
  end
end
