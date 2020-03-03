require 'rails_helper'

describe Document do
  describe 'associations' do
    it { is_expected.to belong_to(:locality).optional }
    it { is_expected.to belong_to :issuing_office }

    it { is_expected.to have_many :conditions }
    it { is_expected.to have_many :prerequisites }
    it { is_expected.to have_many :required_documents }
    it { is_expected.to have_many :approvals }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:issuing_office).with_prefix }
  end
end
