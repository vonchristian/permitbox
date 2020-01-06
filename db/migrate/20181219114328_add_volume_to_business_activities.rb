class AddVolumeToBusinessActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :business_activities, :volume, :decimal, default: 0, null: false
  end
end
