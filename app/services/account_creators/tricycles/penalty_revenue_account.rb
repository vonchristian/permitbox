module AccountCreators
  module Tricycles 
    class PenaltyRevenueAccount 
      attr_reader :tricycle
     
      def initialize(tricycle:)
        @tricycle = tricycle
      end 

      def create_accounts!
        create_penalty_revenue_account 
      end 

      private 
      def create_penalty_revenue_account
        if tricycle.penalty_revenue_account.blank?
          account = Accounting::Revenue.create!(
            name: revenue_name,  
            code: SecureRandom.uuid
          )
          tricycle.update(penalty_revenue_account: account)
        end 
      end 

      def revenue_name
        "Fines, Penalties and Charges - #{tricycle.account_number}"
      end 
    end 
  end 
end 