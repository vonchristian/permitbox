module BusinessRegistration
  class BusinessActivitiesController < ApplicationController
    skip_before_action :authenticate_user!
    layout 'taxpayers'

    def new
      @cart = Cart.find(params[:cart_id])
      @locality = @cart.locality
      if params[:line_of_business_search].present?
        @line_of_businesses = @locality.line_of_businesses.text_search(params[:line_of_business_search]).paginate(page: params[:page], per_page: 10)
      else
        @line_of_businesses = @locality.line_of_businesses.all.paginate(page: params[:page], per_page: 10)
      end
      @line_of_business = BusinessRegistration::BusinessActivityProcessing.new
    end
  end
end
