module ChargeCalculators
  class MayorsPermitFee
    attr_reader :chargeable, :line_of_business, :quantity, :business_activity, :cart
    def initialize(args)
      @chargeable        = args[:chargeable]
      @business_activity = args[:business_activity]
      @line_of_business  = @business_activity.line_of_business
      @quantity          = args[:quantity]
      @cart              = args[:cart]
    end

    def calculate_charge
      cart.voucher_amounts.credit.create!(
        name:    "Mayors Permit Fee (#{line_of_business.name})",
        amount:  business_activity.total_fee_amount,
        account: business_activity.revenue_account
      )
    end
  end
end
