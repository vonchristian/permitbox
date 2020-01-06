require 'rails_helper'

module Businesses
  describe BusinessIncentive do
    describe 'associations' do
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :incentive }
    end
  end
end
