module GovModule
  module BusinessPermitApplications
    class VolumeProcessing
      include ActiveModel::Model
      attr_reader :volume, :business_activity_id

      def process!
        ActiveRecord::Base.transaction do
          update_business_activity
        end
      end
      private
      def update_business_activity
        find_business_activity.update_attributes!(
          volume: volume.to_f)
      end
      def find_business_activity
        Businesses::BusinessActivity.find(business_activity_id)
      end
    end
  end
end
