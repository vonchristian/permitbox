module BusinessesSection
  module Settings
    class PrerequisitesController < ApplicationController
      def new
        @document = Document.find(params[:document_id])
        @documents = current_locality.documents.where.not(id: @document.id)
        @prerequisite = @document.prerequisites.build
      end
      def create
        @document = Document.find(params[:document_id])
        @prerequisite = @document.prerequisites.find_or_create_by(sub_document_id: params[:sub_document_id])
        redirect_to new_businesses_section_document_prerequisite_url(@document), notice: "Prerequisite saved successfully"
      end
    end
  end
end
