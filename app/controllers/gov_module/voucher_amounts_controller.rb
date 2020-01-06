module GovModule
  class VoucherAmountsController < ApplicationController
    def new
      @amountable = params[:amountable_type].constantize.find(params[:amountable_id])
      @voucher_amount = GovModule::VoucherAmountProcessing.new
    end
    def create
      @amountable = params[:gov_module_voucher_amount_processing][:amountable_type].
      constantize.find(params[:gov_module_voucher_amount_processing][:amountable_id])
      @voucher_amount = GovModule::VoucherAmountProcessing.new(voucher_amount_params)
      if @voucher_amount.valid?
        @voucher_amount.process!
        redirect_to new_gov_module_voucher_amount_url(
          amountable_id: params[:gov_module_voucher_amount_processing][:amountable_id],
          amountable_type: params[:gov_module_voucher_amount_processing][:amountable_type]),
          notice: "Charge added successfully."
      else
        render :new
      end
    end

    def destroy
      @amountable = params[:amountable_type].constantize.find(params[:amountable_id])
      @voucher_amount = Vouchers::VoucherAmount.find(params[:id])
      @voucher_amount.destroy
      redirect_to new_gov_module_voucher_amount_url(amountable_id: @amountable.id, amountable_type: @amountable.class.to_s),
      alert: "Charge removed successfully."
    end

    private
    def voucher_amount_params
      params.require(:gov_module_voucher_amount_processing).
      permit(:amountable_id, :amountable_type, :revenue_account_id, :name, :amount, :locality_id)
    end
  end
end
