module Accounting
  module BalanceFinders
    class AmountsFromDateToDate
      attr_reader :from_date, :to_date, :amounts
      def initialize(args)
        @from_date = args[:from_date]
        @to_date   = args[:to_date]
        @amounts   = args[:amounts]
      end

      def compute
        date_range = DateRange.new(from_date: from_date, to_date: to_date)
        amounts.joins(:entry).where('entries.date' => date_range.start_date..date_range.end_date).total
      end
    end
  end
end
