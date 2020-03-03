module GovModule
  module BusinessPermitApplications
    class ChargeProcessing
      include ActiveModel::Model
      attr_accessor :charge_id, :business_permit_application_id, :business_id, :cart_id
      def process!
        ActiveRecord::Base.transaction do
          create_business_charge
        end
      end

      private
      def create_business_charge 
          create_charge_for_business
      end 

      def create_charge_for_business
        if find_business.business_charges.cancelled.find_by(charge_id: charge_id).present?
          business_charge = find_business.business_charges.cancelled.find_by(charge_id: charge_id)
          business_charge.update!(cancelled_at: nil)
        else 
          business_charge = find_business.business_charges.build(charge: find_charge)
          create_accounts(business_charge)
          business_charge.save!
        end 
        create_charge(business_charge)
    end 
      

      def create_charge(business_charge)
        find_cart.voucher_amounts.credit.create!(
          name:    find_charge.name,
          amount:  find_charge.amount,
          account: business_charge.revenue_account
        )
      end
      
      def find_cart
        if cart_id.present?
          Cart.find(cart_id)
        else 
          find_business_permit_application.cart 
        end 
      end 

      def find_business_permit_application
        BusinessPermitApplication.find(business_permit_application_id)
      end
      def find_business
        if business_id.present?
          Business.find(business_id)
        else 
          find_business_permit_application.business 
        end 
      end 
      def find_charge
        Charge.find(charge_id)
      end

      def create_accounts(business_charge)
        AccountCreators::Businesses::BusinessChargeRevenueAccount.new(business_charge: business_charge).create_accounts!
      end 
    end
  end
end
