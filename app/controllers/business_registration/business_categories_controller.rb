module BusinessRegistration
  class BusinessCategoriesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]
    def create
      @taxpayer = Taxpayer.find(params[:business_registration_business_category_processing][:taxpayer_id])
      @cart = Cart.find(params[:business_registration_business_category_processing][:cart_id])
      @locality = @cart.locality
      @business_category = BusinessRegistration::BusinessCategoryProcessing.new(business_category_params)
      @business_category.process!
      redirect_to new_taxpayer_business_registration_url(taxpayer_id: @taxpayer.id, locality_id: @locality.id, cart_id: @cart.id)
    end

    private
    def business_category_params
      params.require(:business_registration_business_category_processing).
      permit(:business_tax_category_id, :cart_id, :locality_id)
    end
  end
end
