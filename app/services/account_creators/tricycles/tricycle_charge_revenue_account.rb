module AccountCreators
  module Tricycles 
    class TricycleChargeRevenueAccount 
      attr_reader :tricycle_charge
      def initialize(tricycle_charge:)
        @tricycle_charge = tricycle_charge
      end 
      def create_accounts!
        create_revenue_account 
      end 

      private 

      def create_revenue_account
        if tricycle_charge.revenue_account.blank?
          account = Accounting::Revenue.create!(
            name: revenue_name,  
            code: SecureRandom.uuid
          )
          tricycle_charge.update(revenue_account: account)
        end 
      end 

      def revenue_name
        "#{tricycle_charge.tricycle_fee_name} - #{SecureRandom.uuid }"
      end 
    end 
  end 
end 