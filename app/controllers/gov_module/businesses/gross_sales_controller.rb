module GovModule
  module Businesses
    class GrossSalesController < ApplicationController
      def new
        @business = Business.find(params[:business_id])
        @gross_sale = Businesses::GrossSaleProcessing.new
      end
      def create
        @business = Business.find(params[:business_id])
        @gross_sale = Businesses::GrossSaleProcessing.new(gross_sale_params)
        if @gross_sale.valid?
          @gross_sale.process!
          redirect_to gov_module_business_url(@business), notice: "Gross Sale saved successfully."
        else
          render :new
        end
      end

      def destroy
        @business = Business.find(params[:business_id])
        @gross_sale = @business.gross_sales.find(params[:id])
        @gross_sale.destroy
        redirect_to gov_module_business_url(@business), notice: "Gross Sale removed successfully."
      end

      private
      def gross_sale_params
        params.require(:gov_module_businesses_gross_sale_processing).
        permit(:business_id, :calendar_year, :amount, :essential)
      end
    end
  end
end
