module GovModule
  module Businesses
    class BusinessPermitApplicationsController < ApplicationController
      def show
        @business = current_locality.businesses.find(params[:business_id])
        @business_permit_application = BusinessPermitApplication.find(params[:id])
      end
    end
  end
end
