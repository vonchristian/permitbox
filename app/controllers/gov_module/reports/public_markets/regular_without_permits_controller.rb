module GovModule
  module Reports
    module PublicMarkets
      class RegularWithoutPermitsController < ApplicationController
        def index
          @public_market = current_locality.public_markets.find(params[:public_market_id])
          @from_date     = params[:from_date] ? Date.parse(params[:from_date]) : Date.current.beginning_of_year
          @to_date       = params[:to_date] ? Date.parse(params[:to_date]) : Date.current.end_of_year
          @businesses = @public_market.regular_tenants.without_permits(from_date: @from_date, to_date: @to_date)
          respond_to do |format|
            format.csv { render_csv }
          end
        end

        private 

      def render_csv
        headers.delete("Content-Length")
        headers["Cache-Control"]       = "no-cache"
        headers["Content-Type"]        = "text/csv"
        headers["Content-Disposition"] = "attachment; filename=\"Businesses Without Permits.csv\""
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
            "Line of Businesses"
          ])
          @businesses.each do |business|
            yielder << CSV.generate_line([
            business.taxpayers_last_and_first_name,
            business.name,
            business.current_location_complete_address,
            business.current_location.barangay_name,
            business.line_of_businesses.pluck(:name).join(","),
            business.line_of_businesses.pluck(:name).join(",")
            ])
        
          end
        end 
      end
      end
    end
  end
end
