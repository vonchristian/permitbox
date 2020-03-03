module GovModule
  module PermitApplications
    module BusinessPermitApplications
      class BusinessActivitiesController < ApplicationController
        def new
          if params[:search].present?
            @line_of_businesses = current_locality.line_of_businesses.text_search(params[:search]).paginate(page: params[:page], per_page: 25)
          else
            @line_of_businesses = current_locality.line_of_businesses.paginate(page: params[:page], per_page: 25)
          end

          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @business_activity = GovModule::BusinessActivityProcessing.new
        end

        def create
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @business_activity = GovModule::BusinessActivityProcessing.new(business_activity_params)
          if @business_activity.valid?
            @business_activity.process!
            redirect_to new_gov_module_permit_applications_business_permit_application_business_activity_url(@business_permit_application), notice: "Line of business added successfully."
          else
            render :new
          end
        end

        def destroy
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @business_activity = @business_permit_application.business.business_activities.find(params[:id])
          ::Businesses::BusinessActivityCancellation.new(business_activity: @business_activity).cancel!
         
          @business_permit_application.cart.voucher_amounts.where(account_id: @business_activity.revenue_account_id).destroy_all
   

          redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application), notice: "Removed successfully."
        end

        private
        def business_activity_params
          params.require(:gov_module_business_activity_processing).
          permit(:cart_id, :quantity, :business_id, :line_of_business_id, :volume, :business_permit_application_id, :employee_id)
        end
      end
    end
  end
end
