module GovModule
  module Businesses
    class RequiredDocumentsController < ApplicationController
      def new
        @documents = current_locality.documents
        @business = Business.find(params[:business_id])
        @required_document = @business.required_documents.build
      end

      def create
        @business = Business.find(params[:business_id])
        @required_document = @business.required_documents.create(required_document_params)
        if @required_document.valid?
          @required_document.save
          redirect_to new_business_required_document_url(@business), notice: "Business Requiremed saved successfully."
        else
          render :new
        end
      end

      def show
        @business = Business.find(params[:business_id])
        @required_document = @business.required_documents.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
            pdf = Localities::RequiredDocumentPdf.new(business: @business, required_document: @required_document, view_context: view_context)
            send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "#{@required_document.title}.pdf"
          end
        end
      end

      private
      def required_document_params
        params.require(:businesses_required_document).
        permit(:document_id)
      end
    end
  end
end
