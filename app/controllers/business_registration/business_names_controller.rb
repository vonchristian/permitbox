module BusinessRegistration
  class BusinessNamesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

    def create
      @business_name = BusinessRegistration::BusinessName.new(business_name_params)
      @cart = Cart.find(params[:business_registration_business_name][:cart_id])
      @locality = Locations::Locality.find(params[:business_registration_business_name][:locality_id])
      @business_name.register!
      redirect_to new_taxpayer_business_registration_url(taxpayer_id: @business_name.find_taxpayer.id, locality_id: @locality.id, cart_id: @cart.id)
    end

    private
    def business_name_params
      params.require(:business_registration_business_name).
      permit(:name, :cart_id, :taxpayer_id, :locality_id)
    end
  end
end
