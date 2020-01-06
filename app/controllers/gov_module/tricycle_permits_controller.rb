module GovModule
  class TricyclePermitsController < ApplicationController
    def show
      @tricycle_permit = current_locality.tricycle_permits.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = GovModule::Permits::TricyclePermitPdf.new(permit: @tricycle_permit, view_context: view_context)
          send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Business Permit.pdf"
        end
      end
    end
  end
end
