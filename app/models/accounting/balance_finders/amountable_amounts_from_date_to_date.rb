module Accounting
  module BalanceFinders
    class AmountableAmountsFromDateToDate
      attr_reader :from_date, :to_date, :amounts, :amountable
      def initialize(args)
        @from_date  = args.fetch(:from_date)
        @to_date    = args.fetch(:to_date)
        @amounts    = args.fetch(:amounts)
        @amountable = args.fetch(:amountable)
      end

      def compute
        date_range = DateRange.new(from_date: from_date, to_date: to_date)

        amounts.where(amountable: amountable).
        joins(:entry).
        where('entries.date' => date_range.start_date..date_range.end_date).
        total
      end
    end
  end
end
