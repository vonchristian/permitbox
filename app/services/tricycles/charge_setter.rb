module Tricycles
  class ChargeSetter
    attr_reader :tricycle, :locality, :charges, :cart

    def initialize(args)
      @tricycle = args.fetch(:tricycle)
      @cart     = args.fetch(:cart)
      @locality = @tricycle.locality
      @charges  = @locality.charges.for_tricycle
    end

    def set_charges!
      charges.each do |charge|
      cart.voucher_amounts.credit.create!(
        name:    charge.name,
        account: charge.revenue_account,
        amount:  charge.amount)
      end
    end
  end
end
