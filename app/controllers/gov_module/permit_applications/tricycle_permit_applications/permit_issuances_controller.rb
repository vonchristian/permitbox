module GovModule
  module PermitApplications
    module TricyclePermitApplications
      class PermitIssuancesController < ApplicationController
        def new
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @permit_issuance = GovModule::PermitApplications::TricyclePermitIssuance.new
        end
        def create
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @permit_issuance = GovModule::PermitApplications::TricyclePermitIssuance.new(permit_params)
          if @permit_issuance.valid?
            @permit_issuance.process!
            redirect_to gov_module_tricycle_permit_path(@permit_issuance.find_permit.id), notice: "Permit issued successfully"
          else
            render :new
          end
        end

        private
        def permit_params
          params.require(:gov_module_permit_applications_tricycle_permit_issuance).
          permit(:permitable_id, :permit_number, :approval_date, :expiry_date, :account_number, :permit_type, :plate_number, :signatory_id)
        end
      end
    end
  end
end
