require 'rails_helper'

describe Tricycle do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :tricycle_organization }
    it { is_expected.to have_many :ownerships }
    it { is_expected.to have_many :taxpayer_owners }
    it { is_expected.to have_many :tricycle_permits }
    it { is_expected.to have_many :chargeables }
    it { is_expected.to have_many :charges }
    it { is_expected.to have_many :voucher_amounts }
    it { is_expected.to have_many :locations }
    it { is_expected.to have_many :tricycle_permit_applications }
  end

  it "#make_and_model" do
    tricycle = build(:tricycle, make: "Honda", model: "TMX155")

    expect(tricycle.make_and_model).to eql("Honda TMX155")
  end
end
