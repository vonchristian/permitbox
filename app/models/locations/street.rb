module Locations
  class Street < ApplicationRecord
    belongs_to :barangay
  end
end
