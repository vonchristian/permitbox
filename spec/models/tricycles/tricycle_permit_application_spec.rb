require 'rails_helper'

module Tricycles 
  describe TricyclePermitApplication do
    describe 'associations' do
      it { is_expected.to belong_to :penalty_revenue_account }
      it { is_expected.to belong_to :tricycle_organization }
      it { is_expected.to belong_to :locality }
      it { is_expected.to belong_to(:tricycle).optional }
      it { is_expected.to belong_to :taxpayer }
      it { is_expected.to have_one  :voucher }
      it { is_expected.to have_many :voucher_amounts }
    end
    describe 'delegations' do
      it { is_expected.to delegate_method(:name).to(:tricycle_organization).with_prefix }
      it { is_expected.to delegate_method(:current_location_complete_address).to(:tricycle) }
      it { is_expected.to delegate_method(:full_name).to(:taxpayer).with_prefix }
    end
    it '#name' do
      taxpayer = create(:taxpayer)
      tricycle_permit_application = create(:tricycle_permit_application, taxpayer: taxpayer)

      expect(tricycle_permit_application.name).to eql(taxpayer.full_name)
    end
  end
end