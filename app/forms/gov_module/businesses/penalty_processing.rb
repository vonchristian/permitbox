module GovModule 
  module Businesses 
    class PenaltyProcessing 
      include ActiveModel::Model
      attr_accessor :amount, :business_permit_application_id, :employee_id 

      validates :amount, presence: true, numericality: true 
      validates :business_permit_application_id, :employee_id, presence: true 

      def process! 
        if valid?
          create_penalty_amount 
        end 
      end 

      private 

      def create_penalty_amount
        find_cart.voucher_amounts.credit.create!(
          amount: amount, 
          account: penalty_revenue_account,
          name: 'Penalties')
      end 

      def find_cart
        find_business_permit_application.cart 
      end 
      
      def penalty_revenue_account
        find_business_permit_application.business.penalty_revenue_account
      end 

      def find_business_permit_application
        find_locality.business_permit_applications.find(business_permit_application_id)
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