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
            "Ownership Type",
            "Business Tax Category",
            "CMCI Category"
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
            permit.business.try(:ownership_type_title),
            permit.business.try(:business_tax_category).try(:title),
            permit.business.line_of_businesses.competetive_index_category_names
            ])
          end
        end 
      end 
    end
  end
end
