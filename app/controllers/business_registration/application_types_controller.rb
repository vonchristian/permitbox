module BusinessRegistration
  class ApplicationTypesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]
    def create
      @cart = Cart.find(params[:business_registration_application_type_processing][:cart_id])
      @taxpayer = Taxpayer.find(params[:business_registration_application_type_processing][:taxpayer_id])
      @locality = @cart.locality
      @application_type = BusinessRegistration::ApplicationTypeProcessing.new(application_type_params)
      @application_type.process!
      redirect_to new_taxpayer_business_registration_url(taxpayer_id: @taxpayer, locality_id: @locality.id, cart_id: @cart.id)
    end

    private
    def application_type_params
      params.require(:business_registration_application_type_processing).
      permit(:cart_id, :application_type)
    end
  end
end
