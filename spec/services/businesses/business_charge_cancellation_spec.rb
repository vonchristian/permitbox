require 'rails_helper'

module Businesses 
  describe BusinessChargeCancellation do 
    it "#cancel!" do 
      business_charge = create(:business_charge, cancelled_at: nil)
      described_class.new(business_charge: business_charge).cancel!

      expect(business_charge.cancelled_at).to_not eql nil 
    end 
  end 
end 
