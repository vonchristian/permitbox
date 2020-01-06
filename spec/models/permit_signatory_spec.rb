require 'rails_helper'

describe PermitSignatory do
  describe 'associations' do
    it { is_expected.to belong_to :permit }
    it { is_expected.to belong_to :signatory }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:full_name).to(:signatory) }
    it { is_expected.to delegate_method(:designation).to(:signatory) }
  end
end
