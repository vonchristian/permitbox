module Taxpayers
  class BusinessRegistrationsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create]

    before_action :authenticate_taxpayer_account!
    
    layout 'taxpayers'
    
    def new
      @cart                    = current_cart
      @application_type        = BusinessRegistration::ApplicationTypeProcessing.new
      @taxpayer                = Taxpayer.find(params[:taxpayer_id])
      @locality                = Locations::Locality.find_by(id: params[:locality_id])
      @business_name           = BusinessRegistration::BusinessName.new
      @business                = Taxpayers::Businesses::Registration.new
      @ownership_types         = OwnershipType.all
      @business_tax_categories = BusinessTaxCategory.all
      @ownership_type          = BusinessRegistration::OwnershipTypeProcessing.new
      @business_category       = BusinessRegistration::BusinessCategoryProcessing.new
      @business_address        = BusinessRegistration::BusinessAddressProcessing.new
      @business_finance        = BusinessRegistration::BusinessFinanceProcessing.new
    end
    def create
      @cart     = Cart.find(params[:taxpayers_businesses_registration][:cart_id])
      @business = Taxpayers::Businesses::Registration.new(registration_params)
      if @business.valid?
        @business.process!
        redirect_to new_business_registration_business_activity_url(cart_id: @cart.id)
      else
        render :new
      end
    end

    private
    def registration_params
      params.require(:taxpayers_businesses_registration).
      permit(:asset_size, :capital, :cart_id, :locality_id)
    end
  end
end
