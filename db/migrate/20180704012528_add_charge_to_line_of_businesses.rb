class AddChargeToLineOfBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_of_businesses, :charge, foreign_key: true, type: :uuid
  end
end
