class CreateHealthCertificateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :health_certificate_configs, id: :uuid do |t|
      t.decimal :fee_amount
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
