require 'rails_helper'

describe Taxpayer do
  describe 'associations' do
    it { is_expected.to have_one :taxpayer_account }
    it { is_expected.to have_many :locations }
    it { is_expected.to have_many :lands }
    it { is_expected.to have_many :buildings }
    it { is_expected.to have_many :machineries }
    it { is_expected.to have_many :businesses }
    it { is_expected.to have_many :ownerships }
    it { is_expected.to have_many :tricycles }
    it { is_expected.to have_many :locality_taxpayers }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:details).to(:current_location).with_prefix }
  end

  it "#full_name" do
    taxpayer = build(:taxpayer, first_name: "Juan", middle_name: "Dela", last_name: "Cruz")

    expect(taxpayer.full_name).to eql "Juan Dela Cruz"
  end

  it ".women" do
    male = create(:taxpayer, sex: 'male')
    female = create(:taxpayer, sex: 'female')
    expect(described_class.women).to include(female)
    expect(described_class.women).to_not include(male)
  end

end
