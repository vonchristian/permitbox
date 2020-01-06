module GovModule
  module Businesses
    class ModeOfPayment
      include ActiveModel::Model
      attr_accessor :mode_of_payment, :business_id

      def process!
        ActiveRecord::Base.transaction do
          save_mode_of_payment
        end
      end

      private
      def save_mode_of_payment
        find_business.update_attributes!(mode_of_payment: mode_of_payment)
      end
      def find_business
        Business.find(business_id)
      end
    end
  end
end
