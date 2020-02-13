require 'rails_helper'

module AccountCreators
  describe BusinessTaxRevenueAccount do 
    it "#create_accounts!" do 
      business = build(:business, business_tax_revenue_account_id: nil)

      described_class.new(business_taxable: business).create_accounts!

      business.save!

      expect(business.business_tax_revenue_account).to_not eql nil 
    end 
  end 
end 
