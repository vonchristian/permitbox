module GovModule
  module Reports
    class LineOfBusinessesController < ApplicationController
      def show
        @line_of_business = current_locality.line_of_businesses.find(params[:id])
        @business_permits = @line_of_business.business_permits
        respond_to do |format|
          format.xlsx
        end
      end
    end
  end
end
