module GovModule
  module Businesses
    class AdditionalChargesController < ApplicationController
      def new
        @business = current_locality.businesses.find(params[:business_id])
        @charge   = GovModule::BusinessPermitApplications::ChargeProcessing.new
      end

      def create
        @business = current_locality.businesses.find(params[:business_id])
        @charge = GovModule::BusinessPermitApplications::ChargeProcessing.new(charge_params)
        @charge.process!
        redirect_to new_gov_module_business_additional_charge_url(@business), notice: "Charge added successfully."
      end

      def destroy
        @business          = current_locality.businesses.find(params[:business_id])
        @business_charge   = @business.business_charges.find(params[:id])
          ::Businesses::BusinessChargeCancellation.new(business_charge: @business_charge).cancel!
        current_cart.voucher_amounts.where(account: @business_charge.revenue_account).destroy_all
        redirect_to new_gov_module_business_assessment_line_item_url(@business), notice: "removed successfully."
      end
      
      private
     
      def charge_params
        params.require(:gov_module_business_permit_applications_charge_processing).
        permit(:business_permit_application_id, :charge_id, :business_id, :cart_id)
      end
    end
  end
end
