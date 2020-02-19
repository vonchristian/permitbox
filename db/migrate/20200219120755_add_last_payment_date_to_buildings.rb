class AddLastPaymentDateToBuildings < ActiveRecord::Migration[6.0]
  def change
    add_column :buildings, :last_payment_date, :datetime
  end
end
