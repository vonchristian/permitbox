module AccountCreators 
  class BusinessChargeRevenueAccount 
    attr_reader :business_charge

    def initialize(business_charge:)
      @business_charge = business_charge
    end 
    def create_accounts!
      create_revenue_account 
    end 

    private 
    def create_revenue_account
      if business_charge.revenue_account.blank?
        account = Accounting::Revenue.create!(
          name: revenue_name, 
          code: SecureRandom.uuid
        )
        business_charge.update!(revenue_account: account)
      end
    end 

    def revenue_name 
      "#{business_charge.charge_name} - #{SecureRandom.uuid}"
    end 
  end 
end 