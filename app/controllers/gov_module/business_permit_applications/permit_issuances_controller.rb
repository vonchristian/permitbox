module GovModule
  module BusinessPermitApplications
    class PermitIssuancesController < ApplicationController
      def new
        @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
        @permit_issuance = GovModule::PermitApplications::BusinessPermitIssuance.new
      end
      def create
        @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
        @permit_issuance = GovModule::PermitApplications::BusinessPermitIssuance.new(permit_params)
        if @permit_issuance.valid?
          @permit_issuance.process!
          redirect_to gov_module_business_permit_path(@permit_issuance.find_permit.id), notice: "Permit issued successfully"
        else
          render :new
        end
      end

      private
      def permit_params
        params.require(:gov_module_permit_applications_business_permit_issuance).
        permit(:permitable_id, :permit_number, :approval_date, :expiry_date, :account_number, :permit_type, :plate_number, :signatory_id)
      end
    end
  end
end
