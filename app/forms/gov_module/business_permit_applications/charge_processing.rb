module GovModule
  module BusinessPermitApplications
    class ChargeProcessing
      include ActiveModel::Model
      attr_accessor :charge_id, :business_permit_application_id
      def process!
        ActiveRecord::Base.transaction do
          create_business_charge
        end
      end

      private
      def create_business_charge 
        if find_business_permit_application.business && find_business_permit_application.business.charges.include?(find_charge)  
          add_charge 
        else 
          create_charge_for_business
        end 
      end 
      def add_charge
        find_business_permit_application.charges << find_charge
      end 
      def create_charge_for_business
        if !find_business_permit_application.charges.include?(find_charge)
          business_charge = find_business_permit_application.business_charges.build(
            charge: find_charge
          )
          create_accounts(business_charge)
          business_charge.save!

          create_charge(business_charge)
        end 
      end 

      def create_charge(business_charge)
        find_business_permit_application.voucher_amounts.credit.create!(
          name:    find_charge.name,
          amount:  find_charge.amount,
          account: business_charge.revenue_account
        )
      end

      def find_business_permit_application
        BusinessPermitApplication.find(business_permit_application_id)
      end
      def find_charge
        Charge.find(charge_id)
      end

      def create_accounts(business_charge)
        AccountCreators::BusinessChargeRevenueAccount.new(business_charge: business_charge).create_accounts!
      end 
    end
  end
end
