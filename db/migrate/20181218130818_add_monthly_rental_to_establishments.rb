class AddMonthlyRentalToEstablishments < ActiveRecord::Migration[5.2]
  def change
    add_column :establishments, :monthly_rental, :decimal
  end
end
