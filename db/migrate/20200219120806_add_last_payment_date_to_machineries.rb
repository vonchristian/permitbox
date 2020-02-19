class AddLastPaymentDateToMachineries < ActiveRecord::Migration[6.0]
  def change
    add_column :machineries, :last_payment_date, :datetime
  end
end
