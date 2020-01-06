module GovModule
  module PermitApplications
    class CapitalProcessing
      include ActiveModel::Model
      attr_accessor :amount, :business_permit_application_id

      validates :amount, presence: true, numericality: true

      def find_business_permit_application
        BusinessPermitApplication.find(business_permit_application_id)
      end

      def process!
        ActiveRecord::Base.transaction do
          update_business_permit_application
          create_charge
        end
      end

      def update_business_permit_application
        find_business_permit_application.update_attributes!(
          capital_amount: amount
        )
      end

      def create_charge
        ChargeCalculators::CapitalTax.new(
          amount: amount.to_f,
          chargeable: find_business_permit_application,
          capital_tax_config: find_business_permit_application.locality.capital_tax_configs.recent
        ).calculate_charge
      end
    end
  end
end
