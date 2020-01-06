module GovModule
  module Businesses
    class Assessment
      include ActiveModel::Model
      attr_accessor :business_id, :date, :employee_id, :account_number
      validates :business_id, :date, :employee_id, presence: true
      def process!
        ActiveRecord::Base.transaction do
          create_voucher
        end
      end
      def find_voucher
        Voucher.find_by(account_number: account_number)
      end

      private
      def create_voucher
        voucher = Voucher.create!(
          locality: find_business.locality,
          preparer_id: employee_id,
          account_number: account_number,
          payee: find_business, date: date )
        voucher.voucher_amounts << find_business.voucher_amounts.without_voucher
      end
      def find_business
        Business.find(business_id)
      end
    end
  end
end
