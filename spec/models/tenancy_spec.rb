require 'rails_helper'

describe Tenancy do
  describe 'associations' do
    it { is_expected.to belong_to :tenant }
    it { is_expected.to belong_to :public_market }
  end
end
