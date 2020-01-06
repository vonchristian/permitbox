module RealProperties
  class Adjustment < ApplicationRecord
    belongs_to :adjustment_factor, class_name: "Configurations::AdjustmentFactor"
    belongs_to :adjustable, polymorphic: true

    delegate :title, to: :adjustment_factor
  end
end
