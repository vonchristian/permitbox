class CreateBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :business_permit_applications, id: :uuid do |t|
      t.references :applicant, polymorphic: true, type: :uuid, index: { name: "index_applicant_on_business_permit_applications" }
      t.datetime :application_date
      t.string :application_number

      t.timestamps
    end
  end
end
