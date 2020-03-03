module GovModule
  module Businesses
    class BusinessActivitiesController < ApplicationController
      def new
        if params[:search].present?
          @line_of_businesses = current_locality.line_of_businesses.text_search(params[:search])
        else
          @line_of_businesses = current_locality.line_of_businesses
        end

        @business = Business.find(params[:business_id])
        @business_activity = GovModule::Businesses::BusinessActivityProcessing.new
      end
      def create
        @business = Business.find(params[:business_id])
        @business_activity = GovModule::Businesses::BusinessActivityProcessing.new(business_activity_params)
        if @business_activity.valid?
          @business_activity.process!
          redirect_to new_gov_module_business_business_activity_url(@business), notice: "Line of business added successfully."
        else
          render :new
        end
      end
      def edit
        @business = current_locality.businesses.find(params[:business_id])
        @business_activity = @business.business_activities.find(params[:id])
      end
      def update
        @business = current_locality.businesses.find(params[:business_id])
        @business_activity = @business.business_activities.find(params[:id])
        @business_activity.update(edit_business_activity_params)
        if @business_activity.valid?
          @business_activity.save
          ChargeCalculators::StoragePermitFee.new(business: @business, business_activity: @business_activity).calculate_charge
          redirect_to gov_module_business_url(@business), notice: "Business activity updated successfully."
        else
          render :edit
        end
      end

      def destroy
        @business          = current_locality.businesses.find(params[:business_id])
        @business_activity = @business.business_activities.find(params[:id])
        ::Businesses::BusinessActivityCancellation.new(business_activity: @business_activity).cancel!
        
        redirect_to gov_module_business_url(@business), notice: "Cancelled successfully."
      end

      private
      def business_activity_params
        params.require(:gov_module_businesses_business_activity_processing).
        permit(:quantity, :business_id, :line_of_business_id, :volume)
      end
      def edit_business_activity_params
        params.require(:businesses_business_activity).
        permit(:quantity, :volume)
      end
    end
  end
end
