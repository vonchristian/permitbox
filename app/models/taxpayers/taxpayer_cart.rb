module Taxpayers
class TaxpayerCart < ApplicationRecord
  belongs_to :taxpayer_account
end
end 