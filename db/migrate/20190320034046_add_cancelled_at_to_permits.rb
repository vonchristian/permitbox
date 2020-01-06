class AddCancelledAtToPermits < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :cancelled_at, :datetime
  end
end
