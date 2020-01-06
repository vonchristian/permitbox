require 'rails_helper'


module Locations
  describe Province do
    describe 'associations' do
      it { is_expected.to belong_to :region }
    end
  end
end
