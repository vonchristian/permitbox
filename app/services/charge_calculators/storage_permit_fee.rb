module ChargeCalculators
  class StoragePermitFee
    attr_reader :chargeable, :business_activity, :storage_permit_fee

    def initialize(args)
      @chargeable           = args[:chargeable]
      @business_activity  = args[:business_activity]
      @storage_permit_fee = Configurations::StoragePermitFeeConfig.find_applicable_for(@business_activity)
    end

    def calculate_charge
      chargeable.voucher_amounts.create(
      name: "Storage Permit Fee",
      amount: storage_permit_fee.fee_amount,
      account: storage_permit_fee.revenue_account)
    end
  end
end
