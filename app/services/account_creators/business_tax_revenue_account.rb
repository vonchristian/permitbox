module AccountCreators 
  class BusinessTaxRevenueAccount 
    attr_reader :business_taxable

    def initialize(business_taxable:)
      @business_taxable = business_taxable
    end 
    
    def create_accounts!
      create_revenue_account 
    end 

    private 
    def create_revenue_account
      if business_taxable.business_tax_revenue_account.blank?
        account = Accounting::Revenue.create!(
          name: revenue_name, 
          code: SecureRandom.uuid
        )
        business_taxable.update!(business_tax_revenue_account: account)
      end
    end 

    def revenue_name 
      "#{business_taxable.name} - #{SecureRandom.uuid}"
    end 
  end 
end 