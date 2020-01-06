require 'rails_helper'

describe PublicMarket do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to have_many :tenancies }
    it { is_expected.to have_many :businesses }
  end
end
