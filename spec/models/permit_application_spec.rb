require 'rails_helper'

describe PermitApplication do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :applicant }
    it { is_expected.to belong_to :permitable }
    it { is_expected.to belong_to(:voucher).optional }
  end
end
