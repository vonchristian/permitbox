module BusinessesSection
  module Settings
    class LineOfBusinessesController < ApplicationController
      def new
        @line_of_business_category = LineOfBusinessCategory.find(params[:line_of_business_category_id])
        @line_of_business = BusinessesSection::Settings::LineOfBusinessProcessing.new
      end

      def create
        @line_of_business_category = LineOfBusinessCategory.find(params[:line_of_business_category_id])
        @line_of_business = BusinessesSection::Settings::LineOfBusinessProcessing.new(line_of_business_params)
        if @line_of_business.valid?
          @line_of_business.process!
          redirect_to businesses_section_line_of_business_category_url(@line_of_business_category), notice: "Line of Business created successfully"
        else
          render :new
        end
      end
      def edit
        @line_of_business_category = LineOfBusinessCategory.find(params[:line_of_business_category_id])
        @line_of_business = LineOfBusiness.find(params[:id])
      end

      def update
        @line_of_business_category = LineOfBusinessCategory.find(params[:line_of_business_category_id])
        @line_of_business = LineOfBusiness.find(params[:id])
        @line_of_business.update(update_line_of_business_params)
        if @line_of_business.valid?
          @line_of_business.save
          redirect_to businesses_section_line_of_business_category_url(@line_of_business_category), notice: "Line of Business created successfully"
        else
          render :edit
        end
      end
      private
      def line_of_business_params
        params.require(:businesses_section_settings_line_of_business_processing).
        permit(:line_of_business_category_id, :name, :fee_amount, :locality_id, :competetive_index_category_id)
      end
      def update_line_of_business_params
        params.require(:line_of_business).
        permit(:line_of_business_category_id, :name, :fee_amount, :locality_id, :competetive_index_category_id)
      end
    end
  end
end
