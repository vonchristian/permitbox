require 'rails_helper'

module Locations
  describe Street do
    describe 'associations' do
      it { is_expected.to belong_to :barangay }
    end
  end
end
