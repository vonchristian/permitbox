require 'rails_helper'

module Businesses
  describe BusinessActivityCancellation do 
    it "#cancel!" do 
      business_activity = create(:business_activity, cancelled_at: nil)

      described_class.new(business_activity: business_activity).cancel!

      expect(business_activity.cancelled_at).to_not eql nil 
    end 
  end 
end 