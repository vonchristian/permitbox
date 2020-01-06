module BusinessRegistration
  class OwnershipTypesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]
    def create
      @taxpayer = Taxpayer.find(params[:business_registration_ownership_type_processing][:taxpayer_id])
      @cart = Cart.find(params[:business_registration_ownership_type_processing][:cart_id])
      @locality = @cart.locality
      @ownership_type = BusinessRegistration::OwnershipTypeProcessing.new(ownership_type_params)
      @ownership_type.process!
      redirect_to new_taxpayer_business_registration_url(taxpayer_id: @taxpayer.id, locality_id: @locality.id, cart_id: @cart.id)
    end

    private
    def ownership_type_params
      params.require(:business_registration_ownership_type_processing).
      permit(:cart_id, :ownership_type_id)
    end
  end
end
