module DocumentTransactions
  class Verification < DocumentTransaction
    def self.entered_on(args={})
      if args[:from_date] && args[:to_date]
        date_range = DateRange.new(from_date: args[:from_date], to_date: args[:to_date])
        where('date' => (date_range.start_date..date_range.end_date))
      else
        all
      end
    end
  end
end
