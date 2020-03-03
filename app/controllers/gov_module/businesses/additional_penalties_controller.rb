module GovModule
  module Businesses
    class AdditionalPenaltiesController < ApplicationController 
    
      def new 
        @business = current_locality.businesses.find(params[:business_id])
        @penalty = GovModule::Businesses::PenaltyProcessing.new
      end 
      
      def create 
        @business = current_locality.businesses.find(params[:business_id])
        @penalty = GovModule::Businesses::PenaltyProcessing.new(penalty_params)
        if @penalty.valid?
          @penalty.process!
          redirect_to new_gov_module_business_assessment_line_item_url(@business), notice: "Penalty saved successfully."
        else 
          render :new 
        end 
      end 

      private 
      def penalty_params
        params.require(:gov_module_businesses_penalty_processing).
        permit(:amount, :business_id, :cart_id, :employee_id)
      end 
    end 
  end 
end 