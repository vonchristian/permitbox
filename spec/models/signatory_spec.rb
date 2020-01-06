require 'rails_helper'

describe Signatory do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to have_many :permit_signatories }
    it { is_expected.to have_many :approved_permits }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :full_name }
    it { is_expected.to validate_presence_of :designation }
    it { is_expected.to validate_uniqueness_of(:full_name).scoped_to(:locality_id) }
  end

  it '.recent' do
    old_signatory = create(:signatory, created_at: Date.yesterday)
    new_signatory = create(:signatory, created_at: Date.today)

    expect(described_class.recent).to eql(new_signatory)
    expect(described_class.recent).to_not eql(old_signatory)
  end
end
