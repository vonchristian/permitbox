require 'rails_helper'

describe LineOfBusiness do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :line_of_business_category }
    it { is_expected.to belong_to :competetive_index_category }
    it { is_expected.to belong_to(:cart).optional }
    it { is_expected.to have_many :line_of_business_charges }

  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:revenue_account).to(:line_of_business_category) }
  end
end
