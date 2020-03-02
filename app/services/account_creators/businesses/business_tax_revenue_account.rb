module AccountCreators 
  module Businesses
    class BusinessTaxRevenueAccount 
      attr_reader :business

      def initialize(business:)
        @business = business
      end 
      
      def create_accounts!
        create_tax_revenue_account 
        create_tax_discount_account
        create_penalty_revenue_account
      end 

      private 
      def create_tax_revenue_account
        if business.tax_revenue_account.blank?
          account = Accounting::Revenue.create!(
            name: revenue_name, 
            code: SecureRandom.uuid
          )
          business.update(tax_revenue_account: account)
        end
      end 

      def create_tax_discount_account
        if business.tax_discount_account.blank?
          account = Accounting::Revenue.create!(
            contra: true,
            name:   discount_revenue_name, 
            code:   SecureRandom.uuid
          )
          business.update(tax_discount_account: account)
        end
      end
      
      def create_penalty_revenue_account
        if business.penalty_revenue_account.blank?
          account = Accounting::Revenue.create!(
            name:   "Fines and Penalties - #{business.account_number}", 
            code:   SecureRandom.uuid
          )
          business.update(penalty_revenue_account: account)
        end
      end

      def revenue_name 
        "#{business.name} - #{business.account_number}"
      end 

      def discount_revenue_name
        "Discount on Business Tax #{business.account_number}"
      end 
    end 
  end 
end 