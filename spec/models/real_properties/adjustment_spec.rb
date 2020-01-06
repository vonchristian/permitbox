require 'rails_helper'

module RealProperties
  describe Adjustment do
    describe 'associations' do
    end
    describe 'delegations' do
      it { is_expected.to delegate_method(:title).to(:adjustment_factor) }
    end
  end
end

