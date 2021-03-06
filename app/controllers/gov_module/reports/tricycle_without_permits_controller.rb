module GovModule
  module Reports
    class TricycleWithoutPermitsController < ApplicationController
      def index
        from_date = params[:from_date] ? Date.parse(params[:from_date]) : Date.current.beginning_of_year
        to_date   = params[:to_date] ? Date.parse(params[:to_date]) : Date.current.end_of_year
        @tricycles = current_locality.tricycles.without_permits(from_date: from_date, to_date: to_date)
        respond_to do |format|
          format.xlsx
        end
      end
    end
  end
end
