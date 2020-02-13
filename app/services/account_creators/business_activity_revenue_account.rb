module AccountCreators 
  class BusinessActivityRevenueAccount 
    attr_reader :business_activity

    def initialize(business_activity:)
      @business_activity = business_activity
    end 
    def create_accounts!
      create_revenue_account 
    end 

    private 
    def create_revenue_account
      if business_activity.revenue_account.blank?
        account = Accounting::Revenue.create!(
          name: revenue_name, 
          code: SecureRandom.uuid
        )
        business_activity.update!(revenue_account: account)
      end
    end 

    def revenue_name 
      "#{business_activity.name} - #{SecureRandom.uuid}"
    end 
  end 
end 