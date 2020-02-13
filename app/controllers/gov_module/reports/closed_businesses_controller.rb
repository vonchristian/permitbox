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
          format.csv
        end
      end

      def render_csv
        headers.delete("Content-Length")
        headers["Cache-Control"]       = "no-cache"
        headers["Content-Type"]        = "text/csv"
        headers["Content-Disposition"] = "attachment; filename=\"Closed Businesses.csv\""
        headers["X-Accel-Buffering"]   = "no"
        self.response_body             = csv_body
        response.status                = 200
      end
  
      private
      def csv_body
        Enumerator.new do |yielder|
          yielder << CSV.generate_line(["Business Permits"])
          yielder << CSV.generate_line([
            "Taxpayer",
            "Business Name",
            "Business Address",
            "Barangay",
            "Line of Businesses",
            "Date Closed"
          ])
          @businesses.each do |business|
            yielder << CSV.generate_line([
            business.taxpayers_last_and_first_name,
            business.name,
            business.current_location_complete_address,
            business.current_location.barangay_name,
            business.line_of_businesses.pluck(:name).join(","),
            business.line_of_businesses.pluck(:name).join(","),
            business.closed_at.strftime('%B %e, %Y')
            ])
        
          end
        end 
      end 
    end 
  end
end
