module Migrators 
  class BusinessActivityMigrator
    attr_reader :business_activity

    def initialize(business_activity:)
      @business_activity = business_activity
    end 
  end 
end 