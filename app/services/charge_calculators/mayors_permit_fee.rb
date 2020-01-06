module ChargeCalculators
  class MayorsPermitFee
    attr_reader :chargeable, :line_of_business, :quantity
    def initialize(args)
      @chargeable = args[:chargeable]
      @line_of_business = args[:line_of_business]
      @quantity = args[:quantity]
    end
    def calculate_charge
      chargeable.voucher_amounts.create(
        name: "Mayors Permit Fee (#{line_of_business.name})",
        amount: quantity * line_of_business.fee_amount,
        account: line_of_business.revenue_account
      )
    end
  end
end
