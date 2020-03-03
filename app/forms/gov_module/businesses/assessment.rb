module GovModule
  module Businesses
    class Assessment
      include ActiveModel::Model
      attr_accessor :business_id, :date, :employee_id, :account_number, :cart_id
      
      validates  :date, :employee_id, :cart_id, :business_id, presence: true
     
      def process!
        if valid?
          ActiveRecord::Base.transaction do
            create_voucher
            remove_cart_reference 
          end
        end 
      end

      def find_voucher
        Voucher.find_by!(account_number: account_number)
      end

      private
      def create_voucher
        voucher = find_locality.vouchers.create!(
          preparer_id: employee_id,
          account_number: account_number,
          payee: find_business, 
          date: date)
        voucher.voucher_amounts << find_cart.voucher_amounts.without_voucher
      end

      def find_business
        Business.find(business_id)
      end

      def find_locality
        find_employee.locality
      end 

      def find_employee
        User.find(employee_id)
      end 

      def remove_cart_reference
        find_cart.voucher_amounts.each do |voucher_amount|
          voucher_amount.cart_id = nil 
          voucher_amount.save!
        end 
      end 

      def find_cart
        Cart.find(cart_id)
      end 
    end
  end
end
