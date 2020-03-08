class CreateHealthCertificateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :health_certificate_categories, id: :uuid do |t|
      t.string :title, null: false 

      t.timestamps
    end
  end
end
