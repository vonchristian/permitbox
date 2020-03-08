class CreateHealthCertificateLabTests < ActiveRecord::Migration[6.0]
  def change
    create_table :health_certificate_lab_tests, id: :uuid do |t|
      t.belongs_to :laboratory, null: false, foreign_key: true, type: :uuid 
      t.belongs_to :lab_test, null: false, foreign_key: true, type: :uuid 
      t.belongs_to :health_certificate, null: false, foreign_key: true, type: :uuid 
      t.integer :result
      t.datetime :date

      t.timestamps
    end
    add_index :health_certificate_lab_tests, :result
  end
end
