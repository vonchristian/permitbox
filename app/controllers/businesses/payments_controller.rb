module Businesses
  class PaymentsController < ApplicationController
    def index
      @business = Business.find(params[:business_id])
    @payments = @business.entries
    end
  end
end
