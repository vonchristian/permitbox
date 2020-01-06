require 'rails_helper'

module Localities
  describe LocalityTaxpayer do
    describe 'associations' do
      it { is_expected.to belong_to :locality }
      it { is_expected.to belong_to :taxpayer }
      it { is_expected.to belong_to :receivable_account }
    end

    describe 'validations' do
      it { is_expected.to validate_uniqueness_of(:receivable_account_id) }
    end
  end
end
