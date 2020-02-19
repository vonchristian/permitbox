class AddLastPaymentDateToLands < ActiveRecord::Migration[6.0]
  def change
    add_column :lands, :last_payment_date, :datetime
  end
end
