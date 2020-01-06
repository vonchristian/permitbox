require 'rails_helper'

module Permits
  describe BusinessPermit do
    describe 'associations' do
      it { is_expected.to belong_to :business }
    end
  end
end
