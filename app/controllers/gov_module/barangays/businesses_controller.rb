module GovModule
  module Barangays
    class BusinessesController < ApplicationController
      def index
        @barangay = current_locality.barangays.find(params[:barangay_id])
        @businesses = @barangay.businesses.distinct
      end
    end
  end
end
