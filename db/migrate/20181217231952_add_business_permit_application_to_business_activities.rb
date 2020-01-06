class AddBusinessPermitApplicationToBusinessActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_activities, :business_permit_application, foreign_key: true, type: :uuid
  end
end
