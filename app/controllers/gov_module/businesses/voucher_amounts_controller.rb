module GovModule
  module Businesses
    class VoucherAmountsController < ApplicationController
      def edit
        @business = Business.find(params[:business_id])
        @voucher_amount = @business.voucher_amounts.find(params[:id])
      end
      def update
        @business = Business.find(params[:business_id])
        @voucher_amount = @business.voucher_amounts.find(params[:id])
        if @voucher_amount.valid?
          @voucher_amount.update(voucher_amount_params)
          redirect_to gov_module_business_url(@business), notice: "Fee updated successfully"
        else
          render :edit
        end
      end

      def destroy
        @business = Business.find(params[:business_id])
        @voucher_amount = @business.voucher_amounts.find(params[:id])
        @voucher_amount.destroy
        redirect_to gov_module_business_url(@business), notice: "Removed successfully"
      end

      private
      def voucher_amount_params
        params.require(:vouchers_voucher_amount).
        permit(:amount, :description)
      end 
    end
  end
end
