require 'rails_helper'

module Permits
  describe BusinessPermit do
    describe 'delegations' do
      it { is_expected.to delegate_method(:business).to(:permitable) }
      it { is_expected.to delegate_method(:name).to(:business).with_prefix }

    end
  end
end
