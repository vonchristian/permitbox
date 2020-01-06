require 'rails_helper'

describe Discount do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :discount_account }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:discount_scope).with_values([:for_business, :for_tricycle, :for_real_property, :applicable_to_all]) }
  end

  describe 'scopes' do
    it '.discounted_accounts' do
      revenue  = create(:revenue)
      asset    = create(:asset)
      discount = create(:discount, discounted_account_ids: [revenue.id])

      expect(described_class.discounted_accounts).to include(revenue)
      expect(described_class.discounted_accounts).to_not include(asset)
    end
  end
end
