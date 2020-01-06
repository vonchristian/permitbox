module GovModule
  module Businesses
    class LocationsController < ApplicationController
      def new
        @business = Business.find(params[:business_id])
        @location = GovModule::Businesses::LocationProcessing.new
      end
      def create
        @business = Business.find(params[:business_id])
        @location = GovModule::Businesses::LocationProcessing.new(location_params)
        if @location.valid?
          @location.process!
          redirect_to gov_module_business_url(@business), notice: "Location saved successfully"
        else
          render :new
        end
      end

      private
      def location_params
        params.require(:gov_module_businesses_location_processing).
        permit(:complete_address, :business_id, :street_id, :barangay_id, :locality_id, :province_id)
      end
    end
  end
end
