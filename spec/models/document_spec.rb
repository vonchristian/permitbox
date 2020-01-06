require 'rails_helper'

describe Document do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :office }
    it { is_expected.to belong_to :agency }

    it { is_expected.to have_many :conditions }
    it { is_expected.to have_many :prerequisites }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:agency).with_prefix }
  end
end
