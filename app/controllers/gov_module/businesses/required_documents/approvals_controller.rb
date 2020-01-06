module GovModule
  module Businesses
    module RequiredDocuments
      class ApprovalsController < ApplicationController
        def new
          @business = Business.find(params[:business_id])
          @required_document = @business.required_documents.find(params[:required_document_id])
          @approval = @required_document.approvals.build
        end
        def create
          @business = Business.find(params[:business_id])
          @required_document = @business.required_documents.find(params[:required_document_id])
          @approval = @required_document.approvals.build(approval_params)
          @approval.applicant = @business
          @approval.office = @required_document.document.issuing_office
          if @approval.valid?
            @approval.save
            redirect_to gov_module_business_url(@business), notice: "Document approved successfully."
          else
            render :new
          end
        end

        private
        def approval_params
          params.require(:document_transactions_approval).
          permit(:date)
        end
      end
    end
  end
end
