module Businesses 
  class BusinessActivityCancellation 
    attr_reader :business_activity

    def initialize(business_activity:)
      @business_activity = business_activity
    end 

    def cancel! 
      @business_activity.update!(cancelled_at: Time.zone.now)
    end 
  end 
end 