module Accounting
  module BalanceFinder
    def balance(opts={})
      balance_finder(opts).new(opts).compute
    end
  end
end
