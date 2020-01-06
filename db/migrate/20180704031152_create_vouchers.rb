class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers, id: :uuid do |t|
      t.references :voucherable, polymorphic: true, type: :uuid
      t.datetime :date
      t.string :token

      t.timestamps
    end
    add_index :vouchers, :token, unique: true
  end
end
