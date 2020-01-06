class AddClosedAtToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :closed_at, :datetime
  end
end
