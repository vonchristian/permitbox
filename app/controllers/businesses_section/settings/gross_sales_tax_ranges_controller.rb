module BusinessesSection
  module Settings
    class GrossSalesTaxRangesController < ApplicationController
      def new
        @business_tax_category = BusinessTaxCategory.find(params[:business_tax_category_id])
        @gross_sales_tax_range = BusinessesSection::Settings::GrossSalesTaxRangeProcessing.new
      end
      def create
        @business_tax_category = BusinessTaxCategory.find(params[:business_tax_category_id])
        @gross_sales_tax_range = BusinessesSection::Settings::GrossSalesTaxRangeProcessing.new(gross_sales_tax_range_params)
        if @gross_sales_tax_range.valid?
          @gross_sales_tax_range.process!
          redirect_to businesses_section_business_tax_category_url(@business_tax_category), notice: "Gross sales tax range created successfully."
        else
          render :new
        end
      end

      private
      def gross_sales_tax_range_params
        params.require(:businesses_section_settings_gross_sales_tax_range_processing).
        permit(:minimum_gross_sale, :maximum_gross_sale, :tax_amount, :business_tax_category_id, :locality_id)
      end
    end
  end
end
