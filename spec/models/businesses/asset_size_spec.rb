require 'rails_helper'

module Businesses
  describe AssetSize do
    describe 'associations' do
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to(:enterprise_scale).optional }
    end

    it ".current" do
      old_asset_size = create(:asset_size, date: Date.today.last_year)
      new_asset_size = create(:asset_size, date: Date.today)

      expect(described_class.current).to eql new_asset_size
    end
  end
end
