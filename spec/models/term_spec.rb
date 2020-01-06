require 'rails_helper'

describe Term do
  describe 'associations' do
    it { is_expected.to belong_to :termable }
  end

  it "#expired?" do
    term = create(:term, expiry_date: Date.today.last_month)
    expect(term.expired?).to be true
  end
end
