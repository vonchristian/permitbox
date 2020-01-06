module GovModule
  module BusinessPermitApplications
    class ChargeProcessing
      include ActiveModel::Model
      attr_accessor :charge_id, :business_permit_application_id
      def process!
        ActiveRecord::Base.transaction do
          create_charge
        end
      end

      private
      def create_charge
        find_business_permit_application.voucher_amounts.create(
          name: find_charge.name,
          amount: find_charge.amount,
          account: find_charge.revenue_account
        )
      end

      def find_business_permit_application
        BusinessPermitApplication.find(business_permit_application_id)
      end
      def find_charge
        Charge.find(charge_id)
      end
    end
  end
end
