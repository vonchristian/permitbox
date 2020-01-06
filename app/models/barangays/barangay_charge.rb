module Barangays
  class BarangayCharge < ApplicationRecord
    belongs_to :barangay, class_name: 'Locations::Barangay'
    belongs_to :charge
  end
end
