module GovModule
  module Businesses
    class ModeOfPaymentsController < ApplicationController
      def create
        @business = Business.find(params[:gov_module_businesses_mode_of_payment][:business_id])
        @mode_of_payment = GovModule::Businesses::ModeOfPayment.new(mode_of_payment_params)
        @mode_of_payment.process!
        redirect_to gov_module_business_url(@business), notice: "Mode of payment saved successfully."
      end

      private
      def mode_of_payment_params
        params.require(:gov_module_businesses_mode_of_payment).permit(:mode_of_payment, :business_id)
      end
    end
  end
end
