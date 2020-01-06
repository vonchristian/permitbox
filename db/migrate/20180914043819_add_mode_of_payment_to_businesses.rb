class AddModeOfPaymentToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :mode_of_payment, :integer
    add_index :businesses, :mode_of_payment
  end
end
