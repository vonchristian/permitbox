module GovModule
  module Businesses
    class BusinessTaxCategoriesController < ApplicationController
      def edit
        @business = Business.find(params[:business_id])
      end
      def update
        @business = Business.find(params[:business_id])
        @business.update_attributes!(business_tax_category_id: params[:business][:business_tax_category_id])
        redirect_to gov_module_business_url(@business), notice: "Business Tax Category updated successfully."
      end
    end
  end
end
