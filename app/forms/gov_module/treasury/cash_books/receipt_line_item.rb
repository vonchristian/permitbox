module GovModule
  module Treasury
    module CashBooks
      class ReceiptLineItem
        include ActiveModel::Model
        attr_accessor :account_id, :amount
        def process!
        end
      end
    end
  end
end
