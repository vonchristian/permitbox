module Businesses 
  class BusinessChargeCancellation 
    attr_reader :business_charge

    def initialize(business_charge:)
      @business_charge = business_charge
    end 

    def cancel! 
      @business_charge.update!(cancelled_at: Time.zone.now)
    end 
  end 
end 