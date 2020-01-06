require 'rails_helper'

describe Location do
  describe 'associations' do
    it { is_expected.to belong_to :locationable }
    it { is_expected.to belong_to :street }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :province }

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

  it "#details" do
    business = create(:business)
    street   = create(:street, name: "Aurora Hill")
    barangay = create(:barangay, name: "Marcos")
    locality = create(:locality, name: "Alfonso")
    province = create(:province, name: "Ifugao")
    location = build(:location,
      locationable: business,
      street: street,
      barangay: barangay,
      locality: locality,
      province: province)

    expect(location.details).to eql("Aurora Hill, Marcos, Alfonso, Ifugao")
  end
end

