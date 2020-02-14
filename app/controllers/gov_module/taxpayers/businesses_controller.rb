module GovModule
  module Taxpayers
    class BusinessesController < ApplicationController
      def index
        @taxpayer          = Taxpayer.find(params[:taxpayer_id])
        @pagy, @businesses = pagy(@taxpayer.businesses.for_locality(locality: current_locality))
      end
      def new
        @taxpayer = Taxpayer.find(params[:taxpayer_id])
        @business = GovModule::Businesses::Registration.new
      end
      def create
         @taxpayer = Taxpayer.find(params[:taxpayer_id])
        @business = GovModule::Businesses::Registration.new(registration_params)
        if @business.valid?
          @business.register!
          redirect_to gov_module_business_path(@business.find_business), notice: "Business saved successfully."
        else
          render :new
        end
      end

      private
      def registration_params
        params.require(:gov_module_businesses_registration).
        permit(:locality_id, :taxpayer_id, :business_name, :business_area, :ownership_type_id,
        :account_number,
        :capital, :date, :business_tax_category_id,
        :street_id, :barangay_id, :locality_id, :province_id, :business_asset_size,
        line_of_business_ids: [])
      end
    end
  end
end
