require 'rails_helper'

module Tricycles
  describe TricycleCharge do
    describe 'attributes' do 
      it { is_expected.to respond_to(:tricycle_id) }
    end
    describe 'associations' do 
      it { is_expected.to belong_to(:tricycle).optional }
      it { is_expected.to belong_to(:tricycle_permit_application).optional }
      it { is_expected.to belong_to :revenue_account }
      it { is_expected.to belong_to :tricycle_fee }
    end 
    
    describe 'validations' do 
      it 'is_expected.to validate_uniqueness_of(:charge_id).scoped_to(:tricycle_id)' do 
        tricycle = create(:tricycle)
        charge   = create(:charge)
        create(:tricycle_charge, tricycle: tricycle, charge: charge)
        tricycle_charge = build(:tricycle_charge, tricycle: tricycle, charge: charge)
        tricycle_charge.save 

        expect(tricycle_charge.errors[:charge_id]).to eql ['has already been taken']
      end 

      it 'is_expected.to validate_uniqueness_of(:charge_id).scoped_to(:tricycle_permit_application_id)' do 
        tricycle_permit_application = create(:tricycle_permit_application)
        charge   = create(:charge)
        create(:tricycle_charge, tricycle_permit_application: tricycle_permit_application, charge: charge)
        tricycle_charge = build(:tricycle_charge, tricycle_permit_application: tricycle_permit_application, charge: charge)
        tricycle_charge.save 

        expect(tricycle_charge.errors[:charge_id]).to eql ['has already been taken']
      end 
    end 
    
    describe 'delegations' do 
      it { is_expected.to delegate_method(:name).to(:tricycle_fee).with_prefix }
      it { is_expected.to delegate_method(:amount).to(:tricycle_fee).with_prefix }

    end 
  end 
end
