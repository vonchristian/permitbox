module GovModule
  module Businesses
    class EstablishmentsController < ApplicationController
      def new
        @business = Business.find(params[:business_id])
        @establishment = PublicMarkets::BusinessProcessing.new
      end
      def create
        @business = Business.find(params[:public_markets_business_processing][:business_id])
        @establishment = PublicMarkets::BusinessProcessing.new(establishment_params)
        @establishment.process!
        redirect_to gov_module_business_url(@business), notice: "Added to market successfully."
      end

      private

      def establishment_params
        params.require(:public_markets_business_processing).
        permit(:public_market_id, :business_id, :tenancy_type)
      end
    end
  end
end
