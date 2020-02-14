class AddTaxpayerToTricycles < ActiveRecord::Migration[6.0]
  def change
    add_reference :tricycles, :taxpayer, foreign_key: true, type: :uuid 
  end
end
