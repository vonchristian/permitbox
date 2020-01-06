module TaxpayerModule
  module Businesses
    class RequiredDocumentsController < ApplicationController
      def show
        @business = Business.find(params[:business_id])
        @required_document = @business.required_documents.find(params[:id])
        respond_to do |format|
          format.pdf do
            pdf = RequiredDocumentPdf.new(@business, @required_document, view_context)
            send_data pdf.render, type: "application/pdf",file_name: "#{@required_document.title}.pdf"
          end
        end
      end
    end
  end
end
