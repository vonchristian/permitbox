require 'rails_helper'

module Tricycles 
  describe TricyclePermitApplication do
    describe 'associations' do
      it { is_expected.to belong_to :tricycle_organization }
      it { is_expected.to belong_to :locality }
      it { is_expected.to belong_to :tricycle }
      it { is_expected.to belong_to :taxpayer }
      it { is_expected.to have_one  :voucher }
      it { is_expected.to have_many :tricycle_permits }
      it { is_expected.to have_many :tricycle_charges }
      it { is_expected.to have_many :tricycle_fees }
    end
    
    describe 'validations' do 
      it { is_expected.to validate_presence_of :application_date }
    end 

    describe 'delegations' do
      it { is_expected.to delegate_method(:penalty_revenue_account).to(:tricycle) }
      it { is_expected.to delegate_method(:name).to(:tricycle_organization).with_prefix }
      it { is_expected.to delegate_method(:current_location_complete_address).to(:tricycle) }
      it { is_expected.to delegate_method(:full_name).to(:taxpayer).with_prefix }
    end
    describe 'enums' do 
      it { is_expected.to define_enum_for(:application_type).with_values([:new_application, :renew]) }
    end 
    it '#name' do
      taxpayer = create(:taxpayer)
      tricycle_permit_application = create(:tricycle_permit_application, taxpayer: taxpayer)

      expect(tricycle_permit_application.name).to eql(taxpayer.full_name)
    end
  end
end