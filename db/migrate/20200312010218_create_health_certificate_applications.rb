class CreateHealthCertificateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :health_certificate_applications, id: :uuid do |t|
      t.references :applicant,          polymorphic: true, null: false, type: :uuid, index: { name: "index_applicant_on_health_cert_applications" }
      t.belongs_to :health_certificate, null: false, foreign_key: true, type: :uuid 
      t.datetime   :application_date,   null: false 
      t.belongs_to :locality,           null: false, foreign_key: true, type: :uuid 

      t.timestamps
    end
  end
end
