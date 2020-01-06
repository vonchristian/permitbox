module GovModule
  module BusinessPermitApplications
    class ChargeProcessingsController < ApplicationController
      def create
        @business_permit_application = BusinessPermitApplication.find(params[:gov_module_business_permit_applications_charge_processing][:business_permit_application_id])
        @charge = GovModule::BusinessPermitApplications::ChargeProcessing.new(charge_params)
        @charge.process!
        redirect_to new_gov_module_business_permit_application_voucher_amount_url(@business_permit_application)
      end

      private
      def charge_params
        params.require(:gov_module_business_permit_applications_charge_processing).
        permit(:business_permit_application_id, :charge_id)
      end
    end
  end
end
