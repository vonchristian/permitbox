module GovModule
  module Reports
    class ClosedBusinessesController < ApplicationController
      def index
        if params[:from_date] && params[:to_date]
          @from_date = Date.parse(params[:from_date])
          @to_date   = Date.parse(params[:to_date])
          @businesses = current_locality.businesses.closed_on(from_date: @from_date, to_date: @to_date)
        else
          @businesses = current_locality.businesses.closed
        end
        respond_to do |format|
          format.xlsx
        end
      end
    end 
  end
end
