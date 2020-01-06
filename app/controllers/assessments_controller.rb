class AssessmentsController < ApplicationController
  def index
    @assessments = Voucher.all
  end
  def show
    @assessment = Voucher.find(params[:id])
    @payment = PaymentProcessing.new
  end
end
