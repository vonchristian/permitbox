class AddPreparerToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_reference :vouchers, :preparer, foreign_key: { to_table: :users }, type: :uuid
    add_reference :vouchers, :disburser,  foreign_key: { to_table: :users }, type: :uuid
  end
end
