require 'rails_helper'

module RealProperties
  describe Valuation do
    describe 'associations' do
      it { is_expected.to belong_to :valuable }
    end
  end
end

