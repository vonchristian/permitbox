module BusinessRegistration
  class BusinessFinancesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

    def create
      @cart = Cart.find(params[:business_registration_business_finance_processing][:cart_id])
      @taxpayer = Taxpayer.find(params[:business_registration_business_finance_processing][:taxpayer_id])
      @locality = @cart.locality
      @business_finance = BusinessRegistration::BusinessFinanceProcessing.new(business_finance_params)
      @business_finance.process!
      redirect_to new_taxpayer_business_registration_url(taxpayer_id: @taxpayer, locality_id: @locality.id, cart_id: @cart.id)
    end

    private
    def business_finance_params
      params.require(:business_registration_business_finance_processing).
      permit(:cart_id, :taxpayer_id, :locality_id, :asset_size, :gross_sale, :capital, :calendar_year)
    end
  end
end
