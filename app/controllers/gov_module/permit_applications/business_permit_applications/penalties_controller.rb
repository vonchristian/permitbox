module GovModule
  module PermitApplications 
    module BusinessPermitApplications 
      class PenaltiesController < ApplicationController 
      
        def new 
          @business_permit_application = current_locality.business_permit_applications.find(params[:business_permit_application_id])
          @penalty = GovModule::Businesses::PenaltyProcessing.new
        end 
        
        def create 
          @business_permit_application = current_locality.business_permit_applications.find(params[:business_permit_application_id])
          @penalty = GovModule::Businesses::PenaltyProcessing.new(penalty_params)
          if @penalty.valid?
            @penalty.process!
            redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application), notice: "Capital saved successfully."
          else 
            render :new 
          end 
        end 

        private 
        def penalty_params
          params.require(:gov_module_businesses_penalty_processing).
          permit(:amount, :business_permit_application_id, :employee_id)
        end 
      end 
    end 
  end 
end 