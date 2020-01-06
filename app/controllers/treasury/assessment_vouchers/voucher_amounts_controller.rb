module Treasury
  module AssessmentVouchers
    class VoucherAmountsController < ApplicationController
      def new
        @voucher = Voucher.find(params[:assessment_voucher_id])
        @voucher_amount = @voucher.voucher_amounts.build
      end

      def create
        @voucher = Voucher.find(params[:assessment_voucher_id])
        @voucher_amount = @voucher.voucher_amounts.create(voucher_amount_params)
        if @voucher_amount.save!
          @voucher_amount.save!
          redirect_to treasury_assessment_voucher_path(@voucher), notice: "added successfully."
        else
          render :new
        end
      end

      private
      def voucher_amount_params
        params.require(:vouchers_voucher_amount).
        permit(:name, :amount, :account_id, :amountable_id, :amountable_type)
      end
    end
  end
end
