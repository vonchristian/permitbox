module GovModule
  module Barangays
    class BusinessPermitsController < ApplicationController
      def index
        @barangay = current_locality.barangays.find(params[:barangay_id])
        if params[:from_date] && params[:to_date]
          from_date = Date.parse(params[:from_date])
          to_date   = Date.parse(params[:to_date])
          @business_permits = @barangay.business_permits.approved_at(from_date: from_date, to_date: to_date)
        else
          @business_permits = @barangay.business_permits
        end

        respond_to do |format|
          format.xlsx
        end
      end
    end
  end
end
