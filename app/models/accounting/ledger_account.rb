module Accounting
  class LedgerAccount < ApplicationRecord
    belongs_to :ledgerable, polymorphic: true
    belongs_to :account
  end
end 
