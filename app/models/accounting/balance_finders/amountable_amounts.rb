module Accounting
  module BalanceFinders
    class AmountableAmounts
      attr_reader :amounts, :amountable
      def initialize(args)
        @amounts    = args.fetch(:amounts)
        @amountable = args.fetch(:amountable)
      end
      def compute
        amounts.where(amountable: amountable).total
      end
    end
  end
end
