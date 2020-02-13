require 'rails_helper'

module AccountCreators 
  describe BusinessActivityRevenueAccount do 
    it "#create_accounts!" do 
      business_activity = build(:business_activity, revenue_account: nil)
      
      described_class.new(business_activity: business_activity).create_accounts!
      business_activity.save!
    
      expect(business_activity.revenue_account).to_not eq nil 
    end 
  end 
end 