module Tricycles 
  module TricyclePermitApplications 
    class PenaltyAmountProcessing 
      include ActiveModel::Model
      attr_accessor :amount, :tricycle_permit_application_id, :cart_id, :employee_id
      validates :amount, :tricycle_permit_application_id, :cart_id, :employee_id, presence: true
      
      def process!
        if valid?
          ApplicationRecord.transaction do 
            create_penalty_amount 
          end 
        end 
      end 

      private 
      def create_penalty_amount
        find_cart.voucher_amounts.credit.create!(
          amount: amount.to_f,
          account: find_tricycle_permit_application.penalty_revenue_account,
          name: 'Fines and Penalties'
        )
      end 

      def find_cart
        Cart.find(cart_id)
      end 

      def find_tricycle_permit_application
        find_locality.tricycle_permit_applications.find(tricycle_permit_application_id)
      end 

      def find_locality
        find_employee.locality
      end 

      def find_employee
        User.find(employee_id)
      end 
    end 
  end 
end