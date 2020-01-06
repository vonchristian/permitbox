class CreateBusinessTaxReceivables < ActiveRecord::Migration[5.2]
  def change
    create_table :business_tax_receivables, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.datetime :date
      t.decimal :amount, default: 0, null: false
      t.belongs_to :employee, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
