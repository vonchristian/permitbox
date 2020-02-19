module GovModule 
  module PermitApplications 
    module TricyclePermitApplications 
      class PenaltyAmountsController < ApplicationController
        def new 
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @penalty = ::Tricycles::TricyclePermitApplications::PenaltyAmountProcessing.new 
        end 
        def create 
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @penalty = ::Tricycles::TricyclePermitApplications::PenaltyAmountProcessing.new(penalty_params)

          if @penalty.valid?
            @penalty.process!

            redirect_to gov_module_permit_applications_tricycle_permit_application_url(@tricycle_permit_application), notice: 'Penalty added successfully'
          else 
            render :new 
          end 
        end 

        private 
        def penalty_params
          params.require(:tricycles_tricycle_permit_applications_penalty_amount_processing).
          permit(:amount, :cart_id, :employee_id, :tricycle_permit_application_id)
        end 
      end 
    end 
  end 
end 