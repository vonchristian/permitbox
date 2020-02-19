require 'rails_helper'

describe Tricycle do
  describe 'associations' do
    it { is_expected.to belong_to :penalty_revenue_account }
    it { is_expected.to belong_to :taxpayer }
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :tricycle_organization }
    it { is_expected.to have_many :tricycle_permits }
    it { is_expected.to have_many :tricycle_charges }
    it { is_expected.to have_many :tricycle_permit_applications }
  end

  it "#make_and_model" do
    tricycle = build(:tricycle, make: "Honda", tricycle_model: "TMX155")

    expect(tricycle.make_and_model).to eql("Honda TMX155")
  end
end
