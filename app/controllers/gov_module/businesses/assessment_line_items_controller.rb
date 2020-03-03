module GovModule 
  module Businesses 
    class AssessmentLineItemsController < ApplicationController 
      def new 
        @business             = current_locality.businesses.find(params[:business_id])
        @assessment_line_item = GovModule::Businesses::AssessmentLineItem.new 
      end 
      def destroy 
        @business = current_locality.businesses.find(params[:business_id])
        current_cart.destroy 
        redirect_to new_gov_module_business_assessment_line_item_url(@business), notice: 'Cancelled successfully.'
      end 
    end 
  end 
end 