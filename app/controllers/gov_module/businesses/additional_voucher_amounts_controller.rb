module GovModule
  module Businesses
    class AdditionalVoucherAmountsController < ApplicationController
      def destroy 
        @business = current_locality.businesses.find(params[:business_id])
        @voucher_amount = current_cart.voucher_amounts.find(params[:id])
        @business_activity = @business.business_activities.find_by(revenue_account: @voucher_amount.account)
        @business_charge   = @business.business_charges.find_by(revenue_account: @voucher_amount.account)
        cancel_business_activity
        cancel_business_charge
        @voucher_amount.destroy 
        redirect_to new_gov_module_business_assessment_line_item_url(@business), notice: 'Amount removed successfully'
      end 

      private 
      def cancel_business_charge
        if @business_charge.present?
          ::Businesses::BusinessChargeCancellation.new(business_charge: @business_charge).cancel!
        end 
      end 

      def cancel_business_activity
        if @business_activity.present? 
          ::Businesses::BusinessActivityCancellation.new(business_activity: @business_activity).cancel!
        end 
      end 
    end 
  end 
end 