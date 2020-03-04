module GovModule
  module PublicMarkets 
    class ReportsController < ApplicationController
      def index 
        @public_market = current_locality.public_markets.find(params[:public_market_id])
      end 
    end 
  end 
end 