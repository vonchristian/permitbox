module BusinessRegistration
  class BusinessAddressesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

    def create
      @cart = Cart.find(params[:business_registration_business_address_processing][:cart_id])
      @taxpayer = Taxpayer.find(params[:business_registration_business_address_processing][:taxpayer_id])
      @locality = @cart.locality
      @application_type = BusinessRegistration::BusinessAddressProcessing.new(address_params)
      @application_type.process!
      redirect_to new_taxpayer_business_registration_url(taxpayer_id: @taxpayer, locality_id: @locality.id, cart_id: @cart.id)
    end

    private
    def address_params
      params.require(:business_registration_business_address_processing).
      permit(:area, :cart_id, :taxpayer_id, :locality_id, :street_number, :complete_address, :street_id, :barangay_id, :locality_id, :province_id)
    end
  end
end
