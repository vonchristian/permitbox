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
    def edit
      @tricycle_permit = current_locality.tricycle_permits.find(params[:id])
    end
    
    def update 
      @tricycle_permit = current_locality.tricycle_permits.find(params[:id])
      @tricycle_permit.update(permit_params)
      if @tricycle_permit.valid?
        @tricycle_permit.save!
        redirect_to gov_module_tricycle_permit_url(@tricycle_permit), notice: 'Permit updated successfully'
      else 
        render :edit 
      end 
    end

    private 
    def permit_params
      params.require(:permits_tricycle_permit).
      permit(:permit_type, :name, :permit_number, :plate_number, :approval_date, :expiry_date)
    end 
  end
end
