module GovModule
  module Barangays
    class CollectionsController < ApplicationController
      def index
        @barangay = current_locality.barangays.find(params[:barangay_id])
      end
    end
  end
end
