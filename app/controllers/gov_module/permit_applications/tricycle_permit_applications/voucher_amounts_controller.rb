module GovModule
  module PermitApplications
    module TricyclePermitApplications
      class VoucherAmountsController < ApplicationController
        def new
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @charge = GovModule::ChargeProcessing.new
        end
        def create
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @charge = GovModule::ChargeProcessing.new(charge_params)
          @charge.process!
          redirect_to new_gov_module_permit_applications_tricycle_permit_application_voucher_amount_url(@tricycle_permit_application), notice: 'saved successfully'
        end

        def edit
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @voucher_amount = current_cart.voucher_amounts.find(params[:id])
        end
        def update
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @voucher_amount = current_cart.voucher_amounts.find(params[:id])
          @voucher_amount.update(update_voucher_amount_params)
          if @voucher_amount.valid?
            @voucher_amount.save
            redirect_to gov_module_permit_applications_tricycle_permit_application_url(@tricycle_permit_application), notice: 'Amount updated successfully.'
          else
            render :edit
          end
        end

        def destroy
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @voucher_amount = current_cart.voucher_amounts.find(params[:id])
          @voucher_amount.destroy
          redirect_to gov_module_permit_applications_tricycle_permit_application_url(@tricycle_permit_application), notice: 'Amount removed successfully.'

        end

        private
        def charge_params
          params.require(:gov_module_charge_processing).
          permit(:charge_id, :cart_id, :locality_id)
        end

        def update_voucher_amount_params
          params.require(:vouchers_voucher_amount).
          permit(:amount)
        end
      end
    end
  end
end
