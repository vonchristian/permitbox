module GovModule
  module PermitApplications
    module BusinessPermitApplications
      class VoucherAmountsController < ApplicationController

        def new
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @charge = GovModule::BusinessPermitApplications::ChargeProcessing.new
        end

        def create
          @business_permit_application = BusinessPermitApplication.find(params[:gov_module_business_permit_applications_charge_processing][:business_permit_application_id])
          @charge = GovModule::BusinessPermitApplications::ChargeProcessing.new(charge_params)
          @charge.process!
          redirect_to new_gov_module_permit_applications_business_permit_application_assessment_url(@business_permit_application)
        end

        def edit
          @voucher_amount = Vouchers::VoucherAmount.find(params[:id])
        end

        def update
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @voucher_amount = Vouchers::VoucherAmount.find(params[:id])
          @voucher_amount.update(amount_params)
          if @voucher_amount.valid?
            @voucher_amount.save
            redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application), notice: 'Amount updated successfully.'
          else
            render :new
          end
        end

        def destroy
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @voucher_amount = @business_permit_application.voucher_amounts.find(params[:id])
          @voucher_amount.destroy
          redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application), notice: "removed successfully."
        end

        private
        def amount_params
          params.require(:vouchers_voucher_amount).permit(:amount)
        end
        def charge_params
          params.require(:gov_module_business_permit_applications_charge_processing).
          permit(:business_permit_application_id, :charge_id)
        end
      end
    end
  end
end
