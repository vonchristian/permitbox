module RealProperties
  class LandsController < ApplicationController
    def index
      @lands = RealPropertyTypes::Land.all
    end

    def show
      @land = RealPropertyTypes::Land.find(params[:id])
    end
  end
end
