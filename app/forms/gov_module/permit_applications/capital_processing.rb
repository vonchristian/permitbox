module GovModule
  module PermitApplications
    class CapitalProcessing
      include ActiveModel::Model
      attr_accessor :amount, :business_permit_application_id

      validates :amount, presence: true, numericality: true

      def find_business_permit_application
        BusinessPermitApplication.find(business_permit_application_id)
      end
      def find_business
        find_business_permit_application.business 
      end 

      def process!
        ActiveRecord::Base.transaction do
          update_capital
          # create_charge
        end
      end

      def update_capital
        if find_business.business_capital.present?
          find_business.business_capital.update!(capital_amount: amount)
        else 
          find_business.create_business_capital(
            capital_amount: amount
          )
        end 
      end

      # def create_charge
      #   ChargeCalculators::CapitalTax.new(
      #     amount: amount.to_f,
      #     chargeable: find_business_permit_application,
      #     capital_tax_config: find_business_permit_application.locality.capital_tax_configs.recent
      #   ).calculate_charge
      # end
    end
  end
end
