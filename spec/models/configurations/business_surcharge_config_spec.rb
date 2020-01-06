require 'rails_helper'

module Configurations
  describe BusinessSurchargeConfig do
    describe 'associations' do
      it { is_expected.to belong_to :locality }
    end

    describe '.scopes' do
      it '.current' do
        old_rate = create(:business_surcharge_config, effectivity_date: Date.current.last_year)
        new_rate = create(:business_surcharge_config, effectivity_date: Date.today)

        expect(described_class.current).to eql(new_rate)
        expect(described_class.current).to_not eql(old_rate)
      end
    end

    it "#compute(amount)" do
      surcharge = create(:business_surcharge_config, rate: 0.02)

      expect(surcharge.compute(100)).to eql 2.0
    end
  end
end
