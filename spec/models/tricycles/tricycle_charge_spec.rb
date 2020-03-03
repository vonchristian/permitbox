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
      it 'is_expected.to validate_uniqueness_of(:tricycle_fee_id).scoped_to(:tricycle_id)' do 
        tricycle      = create(:tricycle)
        tricycle_fee  = create(:tricycle_fee)
        create(:tricycle_charge, tricycle: tricycle, tricycle_fee: tricycle_fee)
        tricycle_charge = build(:tricycle_charge, tricycle: tricycle, tricycle_fee: tricycle_fee)
        tricycle_charge.save 

        expect(tricycle_charge.errors[:tricycle_fee_id]).to eql ['has already been taken']
      end 
    end 
    
    describe 'delegations' do 
      it { is_expected.to delegate_method(:name).to(:tricycle_fee).with_prefix }
      it { is_expected.to delegate_method(:amount).to(:tricycle_fee).with_prefix }

    end 
  end 
end
