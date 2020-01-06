require 'rails_helper'

module Accounting
  describe Amount do
    describe 'associations' do
      it { is_expected.to belong_to :account }
      it { is_expected.to belong_to :entry }
      it { is_expected.to belong_to :amountable }
    end
    it '#balance' do
      pending 'no test'
    end
  end
end
