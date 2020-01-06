class CreateDocumentaryStampTaxConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :documentary_stamp_tax_configs, id: :uuid do |t|
      t.string :accounts, array: true, default: '{}'
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
      t.decimal :fee_amount
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
