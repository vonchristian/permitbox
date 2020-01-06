require 'rails_helper'

module Accounting
  describe LedgerAccount do
    describe 'associations' do
      it { is_expected.to belong_to :ledgerable }
      it { is_expected.to belong_to :account }
    end
  end 
end
