module Assessments
  class PaymentsController < ApplicationController
    def new
      @assessment = Voucher.find(params[:assessment_id])
      @payment = PaymentProcessing.new
    end
    def create
       @assessment = Voucher.find(params[:assessment_id])
      @payment = PaymentProcessing.new(payment_params)
      if @payment.valid?
        @payment.process!
        redirect_to gov_module_assessments_url, notice: "Payment saved successfully."
      else
        render :new
      end
    end

    private
    def payment_params
      params.require(:payment_processing).
      permit(:date, :reference_number, :voucher_id, :cash_account_id, :employee_id)
    end
  end
end
