module Treasury
  module Assessments
    class BusinessPermitApplicationsController < ApplicationController

      def index
        if params[:search].present?
          @vouchers = current_locality.vouchers.business_permit_application_vouchers.text_search(params[:search]).paginate(page: params[:page], per_page: 25)
        else
          @vouchers = current_locality.vouchers.business_permit_application_vouchers.paginate(page: params[:page], per_page: 25)
        end
      end

      def show
        @voucher = current_locality.vouchers.find(params[:voucher_id])
      end
    end
  end
end
