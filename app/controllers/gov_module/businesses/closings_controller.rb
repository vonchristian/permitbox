module GovModule
  module Businesses
    class ClosingsController < ApplicationController
      def new
        @business = current_locality.businesses.find(params[:business_id])
        @closing = ::Businesses::Closing.new
      end
      def create
        @business = current_locality.businesses.find(params[:business_id])
        @closing = ::Businesses::Closing.new(closing_params)
        if @closing.valid?
          @closing.process!
          redirect_to gov_module_business_url(@business), alert: 'Business closed successfully'
        else
          render :new
        end
      end

      private
      def closing_params
        params.require(:businesses_closing).
        permit(:business_id, :closed_at)
      end
    end
  end
end
