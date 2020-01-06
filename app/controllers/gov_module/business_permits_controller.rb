module GovModule
  class BusinessPermitsController < ApplicationController
    def show
      @business_permit = current_locality.business_permits.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = GovModule::Permits::BusinessPermitPdf.new(permit: @business_permit, view_context: view_context)
          send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Business Permit.pdf"
        end
      end
    end
    def edit
      @business_permit = current_locality.business_permits.find(params[:id])
    end
    def update
      @business_permit = current_locality.business_permits.find(params[:id])
      @business_permit.update(permit_params)
      if @business_permit.valid?
        @business_permit.save!
        redirect_to gov_module_business_permit_url(@business_permit), notice: "Permit updated successfully."
      else
        render :edit
      end
    end
    private
    def permit_params
      params.require(:permits_business_permit).
      permit(:plate_number, :permit_type, :permit_number, :approval_date, :expiry_date)
    end
  end
end
