module GovModule
  module TricycleOrganizations
    class WithPermitsController < ApplicationController
      def index
        @tricycle_organization = TricycleOrganization.find(params[:tricycle_organization_id])
        from_date = params[:from_date] ? Date.parse(params[:from_date]) : Date.current.beginning_of_year
        to_date   = params[:to_date] ? Date.parse(params[:to_date]) : Date.current.end_of_year
        @tricycle_permits = ::Permits::TricyclePermit.approved_at(from_date: from_date, to_date: to_date)
        respond_to do |format|
          format.xlsx
        end
      end
    end
  end
end
