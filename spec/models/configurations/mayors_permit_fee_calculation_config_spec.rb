require 'rails_helper'

module Configurations
  describe MayorsPermitFeeCalculationConfig do
    describe 'associations' do
      it { is_expected.to have_many :localities }
    end
    describe 'enums'do
      it do
        should define_enum_for(:config_type).with([:based_on_enterprise_scale, :per_line_of_business, :based_on_business_tax])
      end

    end
  end
end
