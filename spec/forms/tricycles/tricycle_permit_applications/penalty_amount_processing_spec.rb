require 'rails_helper'

module Tricycles
  module TricyclePermitApplications 
    describe PenaltyAmountProcessing do 
      describe 'attributes' do 
        it { is_expected.to respond_to(:cart_id) }
        it { is_expected.to respond_to(:amount) }
        it { is_expected.to respond_to(:employee_id) }
        it { is_expected.to respond_to(:tricycle_permit_application_id) }
      end 

      it "#process!" do 
        bplo_officer                = create(:bplo_officer)
        tricycle_permit_application = create(:tricycle_permit_application, locality: bplo_officer.locality)
        cart                        = create(:cart)

        described_class.new(amount: 100, cart_id: cart.id, tricycle_permit_application_id: tricycle_permit_application.id, employee_id: bplo_officer.id).process!

        expect(cart.voucher_amounts.credit.pluck(:account_id)).to include(tricycle_permit_application.penalty_revenue_account.id)
        expect(cart.voucher_amounts.credit.pluck(:name)).to include("Fines and Penalties")
        expect(cart.voucher_amounts.credit.total).to eql 100


      end 
    end 
  end 
end 