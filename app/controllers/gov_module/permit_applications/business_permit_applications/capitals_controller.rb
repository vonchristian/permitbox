module GovModule
  module PermitApplications
    module BusinessPermitApplications
      class CapitalsController < ApplicationController
        def new
          @business_permit_application = current_locality.business_permit_applications.find(params[:business_permit_application_id])
          @capital = GovModule::PermitApplications::CapitalProcessing.new
        end
        def create
          @business_permit_application = current_locality.business_permit_applications.find(params[:business_permit_application_id])
          @capital = GovModule::PermitApplications::CapitalProcessing.new(capital_params)
          if @capital.valid?
            @capital.process!
            redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application), notice: "Capital saved successfully."
          else
            render :new
          end
        end

        private
        def capital_params
          params.require(:gov_module_permit_applications_capital_processing).
          permit(:amount, :business_permit_application_id)
        end
      end
    end
  end
end
