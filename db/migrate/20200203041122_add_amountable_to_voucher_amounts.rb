class AddAmountableToVoucherAmounts < ActiveRecord::Migration[6.0]
  def change
    add_reference :voucher_amounts, :amountable, polymorphic: true, type: :uuid 
  end
end
