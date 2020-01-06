module GovModule
  module TricyclePermits
    class PermitSignatoriesController < ApplicationController
      def new
        @tricycle_permit = current_locality.tricycle_permits.find(params[:tricycle_permit_id])
        @permit_signatory = @tricycle_permit.permit_signatories.build
      end
      def create
        @tricycle_permit = current_locality.tricycle_permits.find(params[:tricycle_permit_id])
        @permit_signatory = @tricycle_permit.permit_signatories.create(permit_signatory_params)
        if @permit_signatory.valid?
          @permit_signatory.save
          redirect_to gov_module_tricycle_permit_url(@tricycle_permit), notice: 'Signatory added successfully'
        else
          render :new
        end
      end
      def destroy
        @tricycle_permit = current_locality.tricycle_permits.find(params[:tricycle_permit_id])
        @permit_signatory = @tricycle_permit.permit_signatories.find(params[:id])
        @permit_signatory.destroy
        redirect_to gov_module_tricycle_permit_url(@tricycle_permit), notice: "Removed successfully."
      end

      private
      def permit_signatory_params
        params.require(:permit_signatory).
        permit(:signatory_id)
      end
    end
  end
end
