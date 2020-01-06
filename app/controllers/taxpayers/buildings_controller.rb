module Taxpayers
  class BuildingsController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
    end
  end
end
