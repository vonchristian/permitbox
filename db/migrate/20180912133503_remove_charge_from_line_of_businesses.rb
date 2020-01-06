class RemoveChargeFromLineOfBusinesses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :line_of_businesses, :charge, foreign_key: true, type: :uuid
  end
end
