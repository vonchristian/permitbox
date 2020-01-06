module GovModule
  module PermitApplications
    module TricyclePermitApplications
      class VouchersController < ApplicationController
        def show
          @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:tricycle_permit_application_id])
          @voucher = Voucher.find_by(account_number: @tricycle_permit_application.account_number)
        end
      end
    end
  end
end
