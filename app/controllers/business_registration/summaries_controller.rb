module BusinessRegistration
  class SummariesController < ApplicationController
    layout 'taxpayers'
    skip_before_action :authenticate_user!, only: [:index]
    def index
      @cart = Cart.find(params[:cart_id])
    end
  end
end
