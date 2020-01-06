module GovModule
  module Businesses
    class ChargesController < ApplicationController
      def new
        @business = Business.find(params[:business_id])
        @charge = @business.charges.build
      end
      def create
        @business = Business.find(params[:business_id])
        @charge = @business.charges.create(charge_params)
        if @charge.valid?
          @charge.save
          Vouchers::VoucherAmount.create!(name: @charge.name, amountable: @business, amount: @charge.amount, account: @charge.revenue_account)
          redirect_to new_gov_module_business_charge_url(@business), notice: "Charge saved successfully"
        else
          render :new
        end
      end

      private
      def charge_params
        params.require(:charge).
        permit(:name, :revenue_account_id, :amount, :locality_id)
      end
    end
  end
end
