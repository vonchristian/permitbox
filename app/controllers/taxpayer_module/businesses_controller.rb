module TaxpayerModule
  class BusinessesController < ApplicationController
    skip_before_action :authenticate_user!
    def show
      @business = current_taxpayer.businesses.find(params[:id])
    end
  end
end
