module GovModule
  module Businesses
    class OwnershipTypesController < ApplicationController
      def edit
        @business = Business.find(params[:business_id])
      end
      def update
        @business = Business.find(params[:business_id])
        @business.update(ownership_type_params)
        if @business.valid?
          @business.save
          redirect_to gov_module_business_url(@business), notice: "Ownership Type updated successfully."
        else
          render :new
        end
      end

      private
      def ownership_type_params
        params.require(:business).permit(:ownership_type_id)
      end
    end
  end
end
