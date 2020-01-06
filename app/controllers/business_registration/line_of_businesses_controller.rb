module BusinessRegistration
  class LineOfBusinessesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]
    def create
      @taxpayer = Taxpayer.find(params[:business_registration_business_activity_processing][:taxpayer_id])
      @cart = Cart.find(params[:business_registration_business_activity_processing][:cart_id])
      @locality = @cart.locality
      @line_of_business = BusinessRegistration::BusinessActivityProcessing.new(business_activity_params)
      @line_of_business.process!
      redirect_to new_business_registration_business_activity_url(cart_id: @cart.id)
    end

    private
    def business_activity_params
      params.require(:business_registration_business_activity_processing).
      permit(:cart_id, :line_of_business_id)
    end
  end
end
