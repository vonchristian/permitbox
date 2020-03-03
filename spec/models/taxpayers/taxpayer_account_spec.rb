require 'rails_helper'

module Taxpayers 
  describe TaxpayerAccount do
    describe 'associations' do 
      it { is_expected.to belong_to :taxpayer }
    end 
  end
end 