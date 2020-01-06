class AddNameToVoucherAmounts < ActiveRecord::Migration[5.2]
  def change
    add_column :voucher_amounts, :name, :string
  end
end
