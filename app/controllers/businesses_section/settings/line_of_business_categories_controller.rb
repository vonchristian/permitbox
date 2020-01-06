module BusinessesSection
  module Settings
    class LineOfBusinessCategoriesController < ApplicationController
      def new
        @line_of_business_category = LineOfBusinessCategory.new
      end
      def create
        @line_of_business_category = LineOfBusinessCategory.create(line_of_business_category_params)
        @line_of_business_category.locality = current_locality
        if @line_of_business_category.valid?
          @line_of_business_category.save!
          redirect_to businesses_section_line_of_business_category_url(@line_of_business_category), notice: "Line of Business Category created successfully."
        else
          render :new
        end
      end

      def show
        @line_of_business_category = LineOfBusinessCategory.find(params[:id])
      end

      private
      def line_of_business_category_params
        params.require(:line_of_business_category).
        permit(:title, :revenue_account_id, :fee_amount, :line_of_business_category_id)
      end
    end
  end
end
