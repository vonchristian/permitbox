class CreateLedgerAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :ledger_accounts, id: :uuid do |t|
      t.references :ledgerable, polymorphic: true, type: :uuid
      t.belongs_to :account, foreign_key: true, type: :uuid 

      t.timestamps
    end
  end
end
