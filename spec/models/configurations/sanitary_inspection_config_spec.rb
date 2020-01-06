require 'rails_helper'

module Configurations
  describe SanitaryInspectionConfig do
    describe 'associations' do
      it { is_expected.to belong_to :locality }
    end

    it "#range" do
      sanitary_inspection_config = build(:sanitary_inspection_config, minimum_area: 1, maximum_area: 100)

      expect(sanitary_inspection_config.range).to eql 1..100
    end
  end
end

