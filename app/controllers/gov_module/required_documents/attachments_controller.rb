module GovModule
  module RequiredDocuments
    class AttachmentsController < ApplicationController
      def new
        @business = Business.find(params[:business_id])
        @required_document = @business.required_documents.find(params[:required_document_id])
        @attachment = @required_document.attachments.build
      end
    end
  end
end
