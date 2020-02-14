module GovModule
  module TricyclePermitApplications 
    class ChargeCancellation 
      attr_reader :voucher_amount, :tricycle_permit_application, :tricycle_charge

      def initialize(voucher_amount:, tricycle_permit_application:)
        @voucher_amount = voucher_amount
        @tricycle_permit_application = tricycle_permit_application
        @tricycle_charge = @tricycle_permit_application.tricycle_charges.find_by(revenue_account: @voucher_amount.account)
      end 
      
      def cancel!
        cancel_charge!
      end 

      private 
      
      def cancel_charge!
        tricycle_charge.update(cancelled_at: Date.current)
      end 
    end 
  end 
end 