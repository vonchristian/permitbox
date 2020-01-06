module GovModule
  module BusinessPermits
    class PermitSignatoriesController < ApplicationController
      def new
        @business_permit = current_locality.business_permits.find(params[:business_permit_id])
        @permit_signatory = @business_permit.permit_signatories.build
      end
      def create
        @business_permit = current_locality.business_permits.find(params[:business_permit_id])
        @permit_signatory = @business_permit.permit_signatories.create(permit_signatory_params)
        if @permit_signatory.valid?
          @permit_signatory.save
          redirect_to gov_module_business_permit_url(@business_permit), notice: 'Signatory added successfully'
        else
          render :new
        end
      end
      def destroy
        @business_permit = current_locality.business_permits.find(params[:business_permit_id])
        @permit_signatory = @business_permit.permit_signatories.find(params[:id])
        @permit_signatory.destroy
        redirect_to gov_module_business_permit_url(@business_permit), notice: "Removed successfully."
      end

      private
      def permit_signatory_params
        params.require(:permit_signatory).
        permit(:signatory_id)
      end
    end
  end
end
