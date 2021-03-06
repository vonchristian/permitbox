require 'rails_helper'

module RealPropertyTypes
  describe Machinery do
    describe 'associations' do
      it { is_expected.to have_many :ownerships }
      it { is_expected.to have_many :taxpayer_owners }
    end
  end
end
