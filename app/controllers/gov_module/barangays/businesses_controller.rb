module GovModule
  module Barangays
    class BusinessesController < ApplicationController
      def index
        @barangay = current_locality.barangays.find(params[:barangay_id])
        if params[:search].present?
          @pagy, @businesses = pagy(@barangay.businesses.text_search(params[:search]))
        else 
          @pagy, @businesses = pagy(@barangay.businesses.distinct)
        end 
      end
    end
  end
end
