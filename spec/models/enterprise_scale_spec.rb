require 'rails_helper'

describe EnterpriseScale do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to have_many :asset_sizes }
    it { is_expected.to have_many :businesses }
  end

  it "#range" do
    enterprise_scale = create(:enterprise_scale, min_asset_size: 1, max_asset_size: 100)

    expect(enterprise_scale.range).to eql(1..100)
  end
end
