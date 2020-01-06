module GovModule
  module Businesses
    class RequirementsController < ApplicationController
      def index
        @business = current_locality.businesses.find(params[:business_id])
      end
    end
  end
end 
