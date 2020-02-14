module GovModule
  module TricyclePermitApplications
    class ChargeProcessing
      include ActiveModel::Model
      attr_accessor :charge_id, :tricycle_permit_application_id, :cart_id
      def process!
        ActiveRecord::Base.transaction do
          create_tricycle_charge
        end
      end

      private
      def create_tricycle_charge 
        if find_tricycle_permit_application.tricycle && find_tricycle_permit_application.tricycle.tricycle_charges.include?(find_tricycle_charge)  
          add_charge 
        else 
          create_charge_for_tricycle
        end 
      end 
      def add_charge
        find_tricycle_permit_application.tricycle_charges << find_tricycle_charge
      end 
      def create_charge_for_tricycle
        if !find_tricycle_permit_application.tricycle_charges.include?(find_tricycle_charge)
          tricycle_charge = find_tricycle_permit_application.tricycle_charges.build(
            charge: find_charge
          )
          create_accounts(tricycle_charge)
          tricycle_charge.save!

          create_charge(tricycle_charge)
        end 
      end 

      def create_charge(tricycle_charge)
        find_cart.voucher_amounts.credit.create!(
          name:    find_charge.name,
          amount:  find_charge.amount,
          account: tricycle_charge.revenue_account
        )
      end

      def find_tricycle_permit_application
        ::Tricycles::TricyclePermitApplication.find(tricycle_permit_application_id)
      end

      def find_tricycle_charge
        find_tricycle_permit_application.tricycle.tricycle_charges.find_by(charge_id: charge_id)
      end

      def create_accounts(business_charge)
        AccountCreators::TricycleChargeRevenueAccount.new(business_charge: business_charge).create_accounts!
      end 
      def find_cart
        Cart.find(cart_id)
      end 
    end
  end
end
