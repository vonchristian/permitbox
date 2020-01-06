class AddLocalityToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_reference :vouchers, :locality, foreign_key: true, type: :uuid
  end
end
