class AddFeeAmountToLineOfBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :line_of_businesses, :fee_amount, :decimal
  end
end
