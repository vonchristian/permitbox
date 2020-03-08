class CreateHealthCertificates < ActiveRecord::Migration[6.0]
  def change
    create_table :health_certificates, id: :uuid do |t|
      t.belongs_to :employee, null: false, foreign_key: { to_table: :taxpayers }, type: :uuid 
      t.belongs_to :health_certificate_category, null: false, foreign_key: true, type: :uuid 

      t.timestamps
    end
  end
end
