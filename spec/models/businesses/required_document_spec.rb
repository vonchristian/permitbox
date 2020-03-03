require 'rails_helper'

module Businesses
  describe RequiredDocument do
    describe 'associations' do
      it { is_expected.to belong_to(:business).optional }
      it { is_expected.to belong_to :document }
      it { is_expected.to have_many :approvals }
      it { is_expected.to have_many :verifications }
    end

    describe 'delegations' do
      it { is_expected.to delegate_method(:title).to(:document) }
      it { is_expected.to delegate_method(:issuing_office_name).to(:document) }
    end
  end
end
