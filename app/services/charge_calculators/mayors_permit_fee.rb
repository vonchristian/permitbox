module ChargeCalculators
  class MayorsPermitFee
    attr_reader :chargeable, :line_of_business, :quantity, :business_activity
    def initialize(args)
      @chargeable        = args[:chargeable]
      @business_activity = args[:business_activity]
      @line_of_business  = @business_activity.line_of_business
      @quantity          = args[:quantity]
    end

    def calculate_charge
      chargeable.voucher_amounts.credit.create(
        name:    "Mayors Permit Fee (#{line_of_business.name})",
        amount:  compute_fee,
        account: business_activity.revenue_account
      )
    end

    def compute_fee
      quantity * line_of_business.fee_amount
    end 
  end
end
