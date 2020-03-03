require 'rails_helper'

module Businesses 
  describe BusinessCharge do
    describe 'associations' do 
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :revenue_account }
      it { is_expected.to belong_to :charge }
    end 
    describe 'delegations' do 
      it { is_expected.to delegate_method(:name).to(:charge).with_prefix }
    end 
  end 
end
