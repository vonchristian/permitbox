module Taxpayers
  class RealPropertiesController < ApplicationController
    def index
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @lands = @taxpayer.lands
    end
  end
end
