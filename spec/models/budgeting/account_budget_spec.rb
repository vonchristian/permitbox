require 'rails_helper'

module Budgeting 
  describe AccountBudget do
    describe 'associations' do 
      it { is_expected.to belong_to :account }
      it { is_expected.to belong_to :locality }
    end 
  end 
end
