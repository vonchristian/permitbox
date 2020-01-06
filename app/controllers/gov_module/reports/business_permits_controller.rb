module GovModule
  module Reports
    class BusinessPermitsController < ApplicationController
      def index
        if params[:from_date] && params[:to_date]
          from_date = Date.parse(params[:from_date])
          to_date   = Date.parse(params[:to_date])
          @business_permits = current_locality.business_permits.not_cancelled.approved_at(from_date: from_date, to_date: to_date)
        else
          @business_permits = current_locality.business_permits.not_cancelled
        end
        respond_to do |format|
        format.html
        format.xlsx
      end
      end
    end
  end
end
