module Tricycles 
  class ApplicableFeeSetter 
    attr_reader :tricycle_permit_application, :tricycle_fees

    def initialize(tricycle_permit_application:)
      @tricycle_permit_application = tricycle_permit_application
      @locality = @tricycle_permit_application.locality
      @tricycle_fees = @locality.tricycle_fees 
    end 

    def applicable_fees
      if tricycle_permit_application.new_application?
         tricycle_fees.for_new_application + tricycle_fees.applicable_to_all
      elsif tricycle_permit_application.renew?
        tricycle_fees.for_renew_application + tricycle_fees.applicable_to_all
      end 
    end 
  end 
end 
      