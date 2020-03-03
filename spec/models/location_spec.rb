require 'rails_helper'

describe Location do
  describe 'associations' do
    it { is_expected.to belong_to :locationable }
    it { is_expected.to belong_to(:street).optional }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to(:province).optional }

  end
  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:street).with_prefix }
    it { is_expected.to delegate_method(:name).to(:barangay).with_prefix }
    it { is_expected.to delegate_method(:name).to(:locality).with_prefix }
  it { is_expected.to delegate_method(:name).to(:province).with_prefix }

  end

  it ".current" do
    old_location = create(:location, created_at: Date.today.last_month)
    new_location = create(:location, created_at: Date.today)

    expect(described_class.current).to eql new_location
  end
end

