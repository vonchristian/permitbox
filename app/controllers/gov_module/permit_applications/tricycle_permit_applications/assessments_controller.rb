module GovModule
  module PermitApplications
    module TricyclePermitApplications
      class AssessmentsController < ApplicationController
        def new
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @assessment = ::Tricycles::Assessment.new
        end
        def create
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @assessment = ::Tricycles::Assessment.new(assessment_params)
          if @assessment.valid?
            @assessment.process!

            redirect_to gov_module_permit_applications_tricycle_permit_application_voucher_url(id: @assessment.find_voucher.id, tricycle_permit_application_id: @tricycle_permit_application.id), notice: "Assessment saved successfully."
          else
            render :new
          end
        end

        private
        def assessment_params
          params.require(:tricycles_assessment).
          permit(:date, :account_number, :tricycle_permit_application_id, :employee_id, :reference_number, :description, :cart_id)
        end
      end
    end
  end
end
