require 'rails_helper'

module Businesses
  describe Establishment do
    describe 'associations' do
      it { is_expected.to belong_to :business }
      it { is_expected.to have_many :area_measurements }
    end
  end
end
