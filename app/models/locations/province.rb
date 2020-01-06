module Locations
  class Province < ApplicationRecord
    belongs_to :region, class_name: "Locations::Region", optional: true

  end
end
