module Treasury
  class AssessmentVouchersController < ApplicationController
    def show
      @voucher = Voucher.find(params[:id])
    end
  end
end
