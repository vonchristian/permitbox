require 'rails_helper'

module Localities
  describe LocalityTaxpayer do
    describe 'associations' do
      it { is_expected.to belong_to :locality }
      it { is_expected.to belong_to :taxpayer }
    end
  end
end
