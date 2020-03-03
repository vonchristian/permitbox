require 'rails_helper'

describe RealPropertySurchargeConfig do
  describe 'associations' do 
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :general_revision }
  end 
end
