module GovModule
  module Reports
    module PublicMarkets
      class RegularWithPermitsController < ApplicationController
        def index
          @public_market = current_locality.public_markets.find(params[:public_market_id])
          @from_date     = params[:from_date] ? Date.parse(params[:from_date]) : Date.current.beginning_of_year
          @to_date       = params[:to_date] ? Date.parse(params[:to_date]) : Date.current.end_of_year
          @business_permits = @public_market.regular_business_permits.not_cancelled.approved_at(from_date: @from_date, to_date: @to_date)
          respond_to do |format|
            format.csv { render_csv }
          end
        end
        private 
        def render_csv
          # Tell Rack to stream the content
          headers.delete("Content-Length")
    
          # Don't cache anything from this generated endpoint
          headers["Cache-Control"] = "no-cache"
    
          # Tell the browser this is a CSV file
          headers["Content-Type"] = "text/csv"
    
          # Make the file download with a specific filename
          headers["Content-Disposition"] = "attachment; filename=\"Business Permits.csv\""
    
          # Don't buffer when going through proxy servers
          headers["X-Accel-Buffering"] = "no"
    
          # Set an Enumerator as the body
          self.response_body = csv_body
    
          response.status = 200
        end
    
        private
    
        def csv_body
          Enumerator.new do |yielder|
            yielder << CSV.generate_line(["Business Permits"])
            yielder << CSV.generate_line([
              "Application Date",
              "Application Number",
              "Date Approved",
              "Permit Number",
              "Taxpayer",
              "Gender",
              "Business Name",
              "Business Address",
              "Business Area",
              "Barangay",
              "Lines of Business",
              "Capital",
              "Gross Sales",
              "Mayors Permit Fees",
              "Business Taxes",
              "Permit Type",
              "Employee Count",
              "Ownership Type"
            ])
            @business_permits.order(approval_date: :asc).each do |permit|
              yielder << CSV.generate_line([
              permit.permitable.try(:application_date).try(:strftime, ("%B %e, %Y")),
              permit.permitable.try(:application_number),
              permit.approval_date.strftime("%B %e, %Y"),
              permit.permit_number,
              permit.business.taxpayers_last_and_first_name,
              permit.business.taxpayer_genders,
              permit.business.name,
              permit.business.current_location_complete_address,
              permit.business.establishments.try(:last).try(:area_measurements).try(:last).try(:area),
              permit.business.current_location.barangay_name,
              permit.business.line_of_businesses.pluck(:name).join(","),
              permit.business.business_capital.try(:capital_amount) || 0,
              permit.business.gross_sales.for_calendar_year(permit.approval_date.year - 1).try(:amount),
              Payments::Classifier.new(voucher: permit.voucher, business: permit.business).mayors_permit_fees,
              Payments::Classifier.new(voucher: permit.voucher, business: permit.business).business_taxes,
              permit.permit_type,
              permit.business.recent_employee_count.try(:total_count),
              permit.business.try(:ownership_type_title)
              ])
            end
          end 
        end 
      end
    end
  end
end
