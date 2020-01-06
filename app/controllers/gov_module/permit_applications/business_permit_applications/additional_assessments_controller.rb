module GovModule
  module PermitApplications
    module BusinessPermitApplications
      class AdditionalAssessmentsController < ApplicationController
        def new
          @business_permit_application = current_locality.business_permit_applications.find(params[:business_permit_application_id])
          @additional_assessment = GovModule::PermitApplications::AdditionalAssessment.new
        end

        def create
          @business_permit_application = current_locality.business_permit_applications.find(params[:business_permit_application_id])
          @additional_assessment = GovModule::PermitApplications::AdditionalAssessment.new(assessment_params)
          if @additional_assessment.valid?
            @additional_assessment.process!
             redirect_to new_gov_module_permit_applications_business_permit_application_assessment_url(@business_permit_application), notice: "Additional assessment added successfully."
          else
            render :new
          end
        end

        private
        def assessment_params
          params.require(:gov_module_permit_applications_additional_assessment).
          permit(:name, :amount, :account_id, :business_permit_application_id)
        end

      end
    end
  end
end
