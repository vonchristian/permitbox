module Tricycles
  class ChargeSetter
    attr_reader :tricycle_permit_application, :locality, :tricycle_fees, :cart

    def initialize(args)
      @tricycle_permit_application = args.fetch(:tricycle_permit_application)
      @cart          = args.fetch(:cart)
      @locality      = @tricycle_permit_application.locality
      @tricycle_fees = Tricycles::ApplicableFeeSetter.new(tricycle_permit_application: tricycle_permit_application).applicable_fees
    end

    def set_charges!
      add_charges 
      create_cart_voucher_amounts 
    end 

    private 

    def create_cart_voucher_amounts
      tricycle_permit_application.tricycle_charges.each do |tricycle_charge|
      cart.voucher_amounts.credit.create!(
        name:       tricycle_charge.tricycle_fee_name,
        account:    tricycle_charge.revenue_account,
        amount:     tricycle_charge.tricycle_fee_amount,
        amountable: tricycle_permit_application
      )
      end
    end

    def add_charges 
      tricycle_fees.each do |fee|
        if !tricycle_permit_application.tricycle_fees.include?(fee)
          create_tricycle_charge(fee)
        end 
      end 
    end 


    def create_tricycle_charge(fee)
      tricycle_charge = tricycle_permit_application.tricycle_charges.build(
        tricycle: tricycle_permit_application.tricycle,
        tricycle_fee: fee
      )
      create_accounts(tricycle_charge)
      tricycle_charge.save! 
    end 

    def create_accounts(tricycle_charge)
      AccountCreators::Tricycles::TricycleChargeRevenueAccount.new(tricycle_charge: tricycle_charge).create_accounts!
    end 
  end
end
