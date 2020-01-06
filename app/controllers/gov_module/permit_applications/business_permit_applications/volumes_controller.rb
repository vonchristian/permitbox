module GovModule
  module PermitApplications
    module BusinessPermitApplications
      class VolumesController < ApplicationController
        def new
          @business_permit_application = current_locality.business_permit_applications.find(params[:business_permit_application_id])
          @business_activity = @business_permit_application.business_activities.find(params[:id])
          @volume = GovModule::BusinessPermitApplications::VolumeProcessing.new
        end
      end
    end
  end
end
