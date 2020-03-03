module GovModule
  module Businesses
    class AdditionalGrossSalesController < ApplicationController

      def new
        @business   = current_locality.businesses.find(params[:business_id])
        @gross_sale = GovModule::GrossSaleProcessing.new
      end

      def create
        @business = current_locality.businesses.find(params[:business_id])
        @gross_sale = GovModule::GrossSaleProcessing.new(gross_sale_params)
        if @gross_sale.valid?
          @gross_sale.process!
          redirect_to new_gov_module_business_assessment_line_item_url(@business), notice: "Gross sales saved successfully."
        else
          render :new
        end
      end


      private
      def gross_sale_params
        params.require(:gov_module_gross_sale_processing).
        permit(:calendar_year, :amount, :business_id, :cart_id, :employee_id, :mode_of_payment, :gross_sale_type)
      end 
    end
  end
end
