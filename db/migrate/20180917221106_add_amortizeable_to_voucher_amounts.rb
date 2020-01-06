class AddAmortizeableToVoucherAmounts < ActiveRecord::Migration[5.2]
  def change
    add_column :voucher_amounts, :amortizeable, :boolean, default: false
  end
end
