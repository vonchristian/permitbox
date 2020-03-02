require 'rails_helper'

describe BusinessPermitApplication do
  describe 'associations' do
    it { is_expected.to belong_to :applicant }
    it { is_expected.to belong_to(:cart).optional }
    it { is_expected.to belong_to :ownership_type }
    it { is_expected.to belong_to :business_tax_category }
    it { is_expected.to belong_to(:business).optional }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :locality }
    it { is_expected.to have_many :voucher_amounts }
    it { is_expected.to have_many :business_activities }
    it { is_expected.to have_many :line_of_businesses }
    it { is_expected.to have_many :business_tax_receivables }
    it { is_expected.to have_many :business_charges }
    it { is_expected.to have_many :charges }
  end
  describe 'delegations' do
    it { is_expected.to delegate_method(:title).to(:ownership_type).with_prefix }
    it { is_expected.to delegate_method(:title).to(:business_tax_category).with_prefix }
    it { is_expected.to delegate_method(:name).to(:barangay).with_prefix }
  end
end
