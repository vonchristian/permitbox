require 'rails_helper'

describe DocumentTransaction do
  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :applicant }
    it { is_expected.to have_one :term }
  end
  describe 'delegations' do
    it { is_expected.to delegate_method(:expired?).to(:term).with_prefix }
  end
end
