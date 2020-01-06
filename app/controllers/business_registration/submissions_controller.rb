module BusinessRegistration
  class SubmissionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]
    def create
      @cart = Cart.find(params[:cart_id])
      @submission = BusinessRegistration::SubmissionProcessing.new
      @submission.cart_id = params[:cart_id]
      @submission.locality_id = params[:locality_id]
      @submission.process!
      redirect_to taxpayer_account_url(current_taxpayer_account), notice: "Application submitted successfully."
    end
  end
end
