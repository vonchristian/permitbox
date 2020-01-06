require 'rails_helper'

module Configurations
  describe MarketValueSchedule do
    describe 'associations' do
      it { is_expected.to belong_to :sub_classification }
    end
  end
end
