require 'rails_helper'

module Barangays
  describe BarangayCharge do
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :charge }
  end
end
