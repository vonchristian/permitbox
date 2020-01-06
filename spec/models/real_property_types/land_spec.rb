require 'rails_helper'

module RealPropertyTypes
  describe Land do
    describe 'associations' do
      it { is_expected.to have_many :ownerships }
      it { is_expected.to have_many :taxpayer_owners }
      it { is_expected.to have_many :valuations }
      it { is_expected.to have_many :property_revisions }
      it { is_expected.to have_many :arps }
      it { is_expected.to have_many :adjustments }
      it { is_expected.to have_many :encumberances }
      it { is_expected.to have_many :area_measurements }
      it { is_expected.to have_many :real_property_classifications }
      it { is_expected.to have_many :real_property_sub_classifications }
    end
  end
end
