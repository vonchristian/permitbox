module ChargeCalculators
  class CapitalTax
    attr_reader :chargeable, :amount, :capital_tax_config

    def initialize(args)
      @chargeable = args.fetch(:chargeable)
      @amount     = args.fetch(:amount)
      @capital_tax_config = args.fetch(:capital_tax_config)
    end

    def compute_tax
      amount * capital_tax_config.rate
    end
    def calculate_charge
      chargeable.voucher_amounts.credit.create(
        name: "Capital Tax",
        amount: amount * capital_tax_config.rate,
        account: capital_tax_config.revenue_account
      )
    end
  end
end
