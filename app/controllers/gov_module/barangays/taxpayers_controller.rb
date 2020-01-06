module GovModule
  module Barangays
    class TaxpayersController < ApplicationController
      def index
        @barangay = current_locality.barangays.find(params[:barangay_id])
        @taxpayers = @barangay.taxpayers
      end
    end
  end
end
