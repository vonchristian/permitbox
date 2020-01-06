class AddQuantityToVoucherAmounts < ActiveRecord::Migration[5.2]
  def change
    add_column :voucher_amounts, :quantity, :decimal, default: 1
  end
end
