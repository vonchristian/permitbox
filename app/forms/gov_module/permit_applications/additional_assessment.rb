module GovModule
  module PermitApplications
    class AdditionalAssessment
      include ActiveModel::Model
      attr_accessor :amount, :name, :account_id, :business_permit_application_id

      def process!
        ActiveRecord::Base.transaction do
          create_voucher_amounts
        end
      end

      private
      def create_voucher_amounts
        find_business_permit_application.voucher_amounts.create(
          amount: amount.to_f,
          account_id: account_id,
          name: name
        )
      end
      def find_business_permit_application
        BusinessPermitApplication.find(business_permit_application_id)
      end
    end
  end
end
