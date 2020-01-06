class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts, id: :uuid do |t|
      t.belongs_to :account, foreign_key: true, type: :uuid
      t.monetize :amount, default: 0, null: false, limit: 8
      t.belongs_to :entry, foreign_key: true, type: :uuid
      t.references :amountable, polymorphic: true, type: :uuid
      t.datetime :date
      t.string :type

      t.timestamps
    end
    add_index :amounts, :type
    add_index :amounts, :date
    add_index :amounts, [:account_id, :entry_id]
    add_index :amounts, [:entry_id, :account_id]
  end
end
