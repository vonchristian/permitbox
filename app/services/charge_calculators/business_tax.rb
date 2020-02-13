module ChargeCalculators
  class BusinessTax
    attr_reader :chargeable, :gross_sale_amount, :revenue_account, :business_tax_amount, :charge_name
    def initialize(args)
      @chargeable            = args[:chargeable]
      @revenue_account       = args[:revenue_account]
      @business_tax_amount   = args[:business_tax_amount]
      @charge_name           = args[:charge_name]
    end

    def calculate_charge
      chargeable.voucher_amounts.credit.create!(
      name:    charge_name,
      amount:  business_tax_amount,
      account: revenue_account)
    end
    def payable_amount
      if chargeable.annually?
        chargeable.business_tax
      else
        chargeable.payable_amount_per_schedule
      end
    end
  end
end
