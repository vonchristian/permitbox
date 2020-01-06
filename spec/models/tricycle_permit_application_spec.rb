require 'rails_helper'

describe TricyclePermitApplication do
  describe 'associations' do
    it { is_expected.to belong_to :tricycle_organization }
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :street }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :tricycle }
    it { is_expected.to belong_to :taxpayer }
    it { is_expected.to have_one  :voucher }
    it { is_expected.to have_many :voucher_amounts }
  end
  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:tricycle_organization).with_prefix }
    it { is_expected.to delegate_method(:current_location_complete_address).to(:tricycle) }
    it { is_expected.to delegate_method(:taxpayers_full_name).to(:tricycle) }
  end
  it '#name' do
    tricycle = create(:tricycle)
    tricycle_permit_application = create(:tricycle_permit_application, tricycle: tricycle)

    expect(tricycle_permit_application.name).to eql(tricycle.taxpayers_full_name)
  end
end
