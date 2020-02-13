module GovModule
  module Reports
    class CompetetiveIndexCategoriesController < ApplicationController
      def show
        @competetive_index_category = CompetetiveIndexCategory.find(params[:id])
        @businesses = @competetive_index_category.businesses
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
          yielder << CSV.generate_line(["#{@competetive_index_category.name}"])
          yielder << CSV.generate_line([
            "Taxpayer",
            "Business Name",
            "Business Address",
            "Barangay",
            "Lines of Business"
          ])
          @businesses.uniq.each do |business|
            yielder << CSV.generate_line([
            business.taxpayers_last_and_first_name,
            business.name,
            business.current_location_complete_address,
            business.current_location.barangay_name,
            business.line_of_businesses.pluck(:name).join(",")
            ])
          end
        end 
      end 
    end
  end
end 
