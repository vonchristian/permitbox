module Businesses
  class BusinessIncentive < ApplicationRecord
    belongs_to :business
    belongs_to :incentive
  end
end
