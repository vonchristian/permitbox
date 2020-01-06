module Configurations
  class SanitaryInspectionConfig < ApplicationRecord
    belongs_to :locality, class_name: "Locations::Locality"

    def self.set_amount_for(area)
      sanitary_inspection_config = all.select{|a| a.range.include?(area) }.first
      if sanitary_inspection_config.present?
        sanitary_inspection_config.fee_amount
      else
        110
      end
    end

    def range
      minimum_area..maximum_area
    end
  end
end
