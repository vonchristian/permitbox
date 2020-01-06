require 'rails_helper'

module Configurations
  describe AssessmentLevel do
    describe 'associations' do
      it { is_expected.to belong_to :classification }
    end
  end
end
