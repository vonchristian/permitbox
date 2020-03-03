module GovModule
  module Businesses 
    class AdditionalBusinessActivitiesController < ApplicationController
      def new
        @business = current_locality.businesses.find(params[:business_id])
        if params[:search].present?
          @pagy, @line_of_businesses = pagy(current_locality.line_of_businesses.text_search(params[:search]))
        else
          @pagy, @line_of_businesses = pagy(current_locality.line_of_businesses)
        end
        @business_activity = GovModule::BusinessActivityProcessing.new
      end

      def create
        @business = current_locality.businesses.find(params[:business_id])
        @business_activity = GovModule::BusinessActivityProcessing.new(business_activity_params)
        if @business_activity.valid?
          @business_activity.process!
          redirect_to new_gov_module_business_additional_business_activity_url(@business), notice: "Line of business added successfully."
        else
          render :new
        end
      end

      def destroy
        @business          = current_locality.businesses.find(params[:business_id])
        @business_activity = @business.business_activities.find(params[:id])
        ::Businesses::BusinessActivityCancellation.new(business_activity: @business_activity).cancel!
        current_cart.voucher_amounts.where(account_id: @business_activity.revenue_account_id).destroy_all
        redirect_to new_gov_module_business_assessment_line_item_url(@business), notice: "Removed successfully."
      end

      private
      def business_activity_params
        params.require(:gov_module_business_activity_processing).
        permit(:cart_id, :quantity, :business_id, :line_of_business_id, :volume, :employee_id)
      end
    end
  end
end
