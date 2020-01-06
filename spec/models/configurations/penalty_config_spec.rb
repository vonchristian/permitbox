require 'rails_helper'

module Configurations
  describe PenaltyConfig do
    describe 'associations' do
      it { is_expected.to belong_to :general_revision }
    end
    describe 'validations' do
      it { is_expected.to validate_numericality_of :rate }
      it { is_expected.to validate_presence_of :rate }
    end
  end
end
