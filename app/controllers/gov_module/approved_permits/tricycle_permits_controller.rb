module GovModule
  module ApprovedPermits
    class TricyclePermitsController < ApplicationController
      def index 
        @from_date        = params[:from_date] ? Date.parse(params[:from_date]) : Date.current.beginning_of_year 
        @to_date          = params[:to_date] ? Date.parse(params[:to_date]) : Date.current.end_of_year 
        @tricycle_permits = current_locality.tricycle_permits.approved_at(from_date: @from_date, to_date: @to_date)
      end 
    end 
  end 
end 