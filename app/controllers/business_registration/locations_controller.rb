module BusinessRegistration
  class LocationsController < ApplicationController
    layout 'taxpayers'
    skip_before_action :authenticate_user!, only: [:new, :create]
    def new
      @cart = Cart.find(params[:cart_id])
      @location = BusinessRegistration::LocationProcessing.new
      @locality = @cart.locality
    end
    def create
      @cart = Cart.find(params[:business_registration_location_processing][:cart_id])
      @location = BusinessRegistration::LocationProcessing.new(location_params)
      if @location.valid?
        @location.process!
        redirect_to business_registration_summaries_url(cart_id: @cart.id)
      else
        render :new
      end
    end

    private
    def location_params
      params.require(:business_registration_location_processing).
      permit(:street_id, :locality_id, :barangay_id, :province_id, :cart_id, :business_area,
      :market_vendor, :public_market_id, :rented, :monthly_rental, :tenancy_type,
      :lessor_name, :lessor_address, :lessor_email, :lessor_contact_number)
    end
  end
end
