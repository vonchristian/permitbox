require 'rails_helper'

describe PublicMarket do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to have_many :tenancies }
    it { is_expected.to have_many :businesses }
    it { is_expected.to have_many :business_permit_applications }
    it { is_expected.to have_many :business_permits }

  end

  describe 'delegations' do 
    it { is_expected.to delegate_method(:name).to(:barangay).with_prefix }
  end 

end
