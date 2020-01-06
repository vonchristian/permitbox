module GovModule
  module PermitApplications
    module BusinessPermitApplications
      class AssessmentsController < ApplicationController
        def index
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @vouchers = @business_permit_application.vouchers 
        end
        def new
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @assessment_voucher = GovModule::BusinessPermitApplications::AssessmentProcessing.new
        end

        def create
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @assessment_voucher = GovModule::BusinessPermitApplications::AssessmentProcessing.new(voucher_params)
          if @assessment_voucher.valid?
            @assessment_voucher.process!
            redirect_to gov_module_voucher_url(@assessment_voucher.find_voucher), notice: "Assessment saved successfully."
          else
            render :new
          end
        end

        private
        def voucher_params
          params.require(:gov_module_business_permit_applications_assessment_processing).
          permit(:business_permit_application_id, :account_number, :description, :date, :employee_id, :reference_number, :locality_id)
        end
      end
    end
  end
end
