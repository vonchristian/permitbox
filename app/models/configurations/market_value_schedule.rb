module Configurations
  class MarketValueSchedule < ApplicationRecord
    belongs_to :sub_classification
  end
end
