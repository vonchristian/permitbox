module GovModule
  module Businesses
    class PaymentsController < ApplicationController
      def index
        @business = Business.find(params[:business_id])
        @payments = @business.payments.uniq
      end
    end
  end
end
