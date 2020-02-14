module GovModule
  module PermitApplications
    module TricyclePermitApplications 
      class ChargeCancellationsController < ApplicationController
        def destroy 
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @voucher_amount = current_cart.voucher_amounts.find(params[:id])
          GovModule::TricyclePermitApplications::ChargeCancellation.new(voucher_amount: @voucher_amount, tricycle_permit_application: @tricycle_permit_application).cancel! 
          @voucher_amount.destroy 

          redirect_to gov_module_permit_applications_tricycle_permit_application_url(@tricycle_permit_application), notice: 'Charge removed successfully.'
        end 
      end 
    end 
  end 
end 