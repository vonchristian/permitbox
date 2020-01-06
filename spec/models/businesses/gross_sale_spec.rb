require 'rails_helper'

module Businesses
  describe GrossSale do
    describe 'associations' do
      it { is_expected.to belong_to :business }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :amount }
      it { is_expected.to validate_numericality_of :amount }

      it { is_expected.to validate_presence_of :calendar_year }
    end
  end
end
