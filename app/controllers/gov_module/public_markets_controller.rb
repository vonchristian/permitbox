module GovModule 
  class PublicMarketsController < ApplicationController 
    def index 
      @public_markets = current_locality.public_markets 
    end 
    
    def show 
      @public_market  = current_locality.public_markets.find(params[:id])
    end 
  end 
end 