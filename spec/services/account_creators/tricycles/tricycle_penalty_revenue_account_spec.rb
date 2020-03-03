require 'rails_helper'

module AccountCreators
  module Tricycles
    describe PenaltyRevenueAccount do 
      it "#create_accounts!" do 
        tricycle = build(:tricycle, penalty_revenue_account_id: nil)

        described_class.new(tricycle: tricycle).create_accounts!

        tricycle.save!

        expect(tricycle.penalty_revenue_account).to_not eql nil 
      end 
    end 
  end 
end 