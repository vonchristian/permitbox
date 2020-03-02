module BusinessesSection
  module Settings
    class GrossSalesTaxRangesController < ApplicationController
      def new
        @business_tax_category = BusinessTaxCategory.find(params[:business_tax_category_id])
        @gross_sales_tax_range = @business_tax_category.gross_sales_tax_ranges.build 
      end
      def create
        @business_tax_category = BusinessTaxCategory.find(params[:business_tax_category_id])
        @gross_sales_tax_range = @business_tax_category.gross_sales_tax_ranges.create(gross_sales_tax_range_params)
        if @gross_sales_tax_range.valid?
          @gross_sales_tax_range.save!
          redirect_to businesses_section_business_tax_category_url(@business_tax_category), notice: "Gross sales tax range created successfully."
        else
          render :new
        end
      end

      private
      def gross_sales_tax_range_params
        params.require(:business_tax_categories_gross_sales_tax_range).
        permit(:minimum_gross_sale, :maximum_gross_sale, :tax_amount, :business_tax_category_id, :tax_type, :tax_amount, :tax_rate, :tax_rate_for_excess, :gross_limit, :locality_id)
      end
    end
  end
end
