require 'rails_helper'

describe Charge do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  it ".total" do
    charge_1 = create(:charge, amount: 100)
    charge_2 = create(:charge, amount: 100)

    expect(described_class.total).to eql 200
  end
end
