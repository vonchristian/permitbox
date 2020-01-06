require 'rails_helper'

describe Permit do
  describe 'associations' do
    it { is_expected.to belong_to :permitable }
    it { is_expected.to belong_to :locality }
    it { is_expected.to have_many :permit_signatories }
    it { is_expected.to have_many :signatories }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :permit_number }
    it { is_expected.to validate_presence_of :approval_date }
    it { is_expected.to validate_presence_of :expiry_date }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:permit_type).with_values([:new_permit, :renew]) }
  end

  describe ".issued" do
    it "with from_date and to_date" do
      first_permit = create(:permit, approval_date: Date.today)
      second_permit = create(:permit, approval_date: Date.today.next_month)

      expect(described_class.approved(from_date: Date.today.beginning_of_month, to_date: Date.today.end_of_month)).to include(first_permit)
      expect(described_class.approved(from_date: Date.today.beginning_of_month, to_date: Date.today.end_of_month)).to_not include(second_permit)
      expect(described_class.approved).to include(first_permit)
      expect(described_class.approved).to include(second_permit)
    end
  end

  it "#expired" do
    expired_permit = create(:permit, expiry_date: Date.today)
    not_expired_permit = create(:permit, expiry_date: Date.today.end_of_year)
    travel_to Date.today + 1.day

    expect(described_class.expired).to include(expired_permit)
    expect(described_class.expired).to_not include(not_expired_permit)
  end

  it ".expired?" do
    permit = create(:permit, expiry_date: Date.today)
    travel_to Date.today + 1.day

    expect(permit.expired?).to be true
  end
end
