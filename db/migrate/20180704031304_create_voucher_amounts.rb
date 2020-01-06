class CreateVoucherAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :voucher_amounts, id: :uuid do |t|
      t.belongs_to :voucher, foreign_key: true, type: :uuid
      t.monetize :amount, default: 0, null: false, limit: 8
      t.belongs_to :account, foreign_key: true, type: :uuid
      t.references :amountable, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
