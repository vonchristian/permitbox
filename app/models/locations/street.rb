module Locations
  class Street < ApplicationRecord
    belongs_to :barangay, optional: true
  end
end
