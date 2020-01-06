module Businesses
  module RequiredDocuments
    class VerificationsController < ApplicationController
      def new
        @business = Business.find(params[:business_id])
        @required_document = Businesses::RequiredDocument.find(params[:required_document_id])
        @approval = @required_document.verifications.build
      end
      def create
        @business = Business.find(params[:business_id])
        @required_document = Businesses::RequiredDocument.find(params[:required_document_id])
        @verification = @required_document.verifications.build(approval_params)
        @verification.applicant = @business
        @verification.approver = current_user

        if @approval.valid?
          @approval.save
          redirect_to business_url(@business), notice: "Document verified successfully."
        else
          render :new
        end
      end

      private
      def approval_params
        params.require(:document_transactions_verification).
        permit(:date)
      end
    end
  end
end
