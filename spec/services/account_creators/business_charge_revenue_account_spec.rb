require 'rails_helper'

module AccountCreators
  describe BusinessChargeRevenueAccount do 
    it "#create_accounts!" do 
      charge          = create(:charge)
      business_charge = build(:business_charge, revenue_account_id: nil, charge: charge)

      described_class.new(business_charge: business_charge).create_accounts!

      business_charge.save!

      expect(business_charge.revenue_account).to_not eql nil 
    end 
  end 
end 
