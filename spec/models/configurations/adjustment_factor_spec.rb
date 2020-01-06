require 'rails_helper'

module Configurations
  describe AdjustmentFactor do
    describe 'associations' do
      it { is_expected.to have_many :adjustments }
    end
  end
end
