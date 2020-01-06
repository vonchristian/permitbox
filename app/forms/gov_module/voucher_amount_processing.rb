module GovModule
  class VoucherAmountProcessing
    include ActiveModel::Model
    attr_accessor :amountable_id, :amountable_type, :revenue_account_id, :name, :amount, :locality_id

    def process!
      ActiveRecord::Base.transaction do
        create_voucher_amount
      end
    end
    private
    def create_voucher_amount
      Vouchers::VoucherAmount.create!(
        name: name,
        amount: amount,
        amountable_type: amountable_type,
        amountable_id: amountable_id,
        account_id: revenue_account_id)
    end
  end
end
