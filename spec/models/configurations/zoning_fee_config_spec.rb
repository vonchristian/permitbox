require 'rails_helper'

module Configurations
  describe ZoningFeeConfig do
    describe 'associations' do
      it { is_expected.to belong_to :locality }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :fee_amount }
      it { is_expected.to validate_numericality_of :fee_amount }
    end
  end
end
