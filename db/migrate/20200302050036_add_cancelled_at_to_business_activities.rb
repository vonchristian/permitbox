class AddCancelledAtToBusinessActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :business_activities, :cancelled_at, :datetime
  end
end
