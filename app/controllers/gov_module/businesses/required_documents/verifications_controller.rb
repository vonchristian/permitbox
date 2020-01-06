module GovModule
  module Businesses
    module RequiredDocuments
      class VerificationsController < ApplicationController
        def create
          @business = Business.find(params[:business_id])
          @required_document = @business.required_documents.find(params[:required_document_id])
          @required_document.verifications.create!(date: Time.zone.now, user: current_user,  applicant: @business)
          redirect_to gov_module_business_url(@business), notice: "Document verified successfully."
        end
      end
    end
  end
end
