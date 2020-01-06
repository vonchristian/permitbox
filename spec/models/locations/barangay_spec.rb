require 'rails_helper'

module Locations
  describe Barangay do
    describe 'associations' do
      it { is_expected.to belong_to :locality }
      it { is_expected.to have_many :streets }
      it { is_expected.to have_many :barangay_charges }
      it { is_expected.to have_many :charges }
    end
  end
end
