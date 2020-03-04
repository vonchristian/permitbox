module GovModule
  module PublicMarkets 
    class BusinessesController < ApplicationController
      def index 
        @public_market     = current_locality.public_markets.find(params[:public_market_id])
        @pagy, @businesses = pagy(@public_market.businesses)
      end 
    end 
  end 
end 