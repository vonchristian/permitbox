module GovModule
  module BploSettings
    class PublicMarketsController < ApplicationController
      def new
        @public_market = current_locality.public_markets.build
      end
      def create
        @public_market = current_locality.public_markets.create(public_market_params)
        if @public_market.valid?
          @public_market.save
          redirect_to businesses_section_settings_url, notice: "Public Market created successfully."
        else
          render :new
        end
      end

      private
      def public_market_params
        params.require(:public_market).permit(:name)
      end
    end
  end
end 
