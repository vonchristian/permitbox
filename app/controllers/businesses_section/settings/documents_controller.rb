module BusinessesSection
  module Settings
    class DocumentsController < ApplicationController
      def new
        @document = Document.new
      end
      def create
        @document = Document.create(document_params)
        @document.locality = current_locality
        if @document.valid?
          @document.save
          redirect_to businesses_section_settings_url, notice: "Requirement created successfully."
        else
          render :new
        end
      end

      private
      def document_params
        params.require(:document).
        permit(:title, :description, :office_id)
      end
    end
  end
end
