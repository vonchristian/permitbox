module AccountCreators 
  module Businesses
    class BusinessTaxRevenueAccount 
      attr_reader :business_taxable

      def initialize(business_taxable:)
        @business_taxable = business_taxable
      end 
      
      def create_accounts!
        create_tax_revenue_account 
        create_tax_discount_account
        create_penalty_revenue_account
      end 

      private 
      def create_tax_revenue_account
        if business_taxable.tax_revenue_account.blank?
          account = Accounting::Revenue.create!(
            name: revenue_name, 
            code: SecureRandom.uuid
          )
          business_taxable.update(tax_revenue_account: account)
        end
      end 

      def create_tax_discount_account
        if business_taxable.tax_discount_account.blank?
          account = Accounting::Revenue.create!(
            contra: true,
            name:   discount_revenue_name, 
            code:   SecureRandom.uuid
          )
          business_taxable.update(tax_discount_account: account)
        end
      end
      
      def create_penalty_revenue_account
        if business_taxable.penalty_revenue_account.blank?
          account = Accounting::Revenue.create!(
            name:   "Fines and Penalties - #{business_taxable.account_number}", 
            code:   SecureRandom.uuid
          )
          business_taxable.update(penalty_revenue_account: account)
        end
      end

      def revenue_name 
        "#{business_taxable.name} - #{business_taxable.account_number}"
      end 
      def discount_revenue_name
        "Discount on Business Tax #{business_taxable.account_number}"
      end 
    end 
  end 
end 