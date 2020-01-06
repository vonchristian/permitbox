module Configurations
  class AdjustmentFactor < ApplicationRecord
    has_many :adjustments, class_name: "RealProperties::Adjustment"
  end
end
