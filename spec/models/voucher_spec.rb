require 'rails_helper'

describe Voucher do
  it { is_expected.to have_secure_token }

  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :payee }
    it { is_expected.to belong_to(:entry).optional }
    it { is_expected.to belong_to :preparer }
    it { is_expected.to have_many :voucher_amounts }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :account_number }
    it { is_expected.to validate_uniqueness_of :account_number }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:payee) }
    it { is_expected.to delegate_method(:full_name).to(:preparer).with_prefix }
    it { is_expected.to delegate_method(:designation).to(:preparer).with_prefix }
  end

  describe 'scopes' do
    it '.entered_on(args={})' do
      voucher     = create(:voucher, date: Date.current)
      old_voucher = create(:voucher, date: Date.current.last_year)

      expect(described_class.entered_on(from_date: Date.current.beginning_of_year, to_date: Date.current.end_of_year)).to include(voucher)
      expect(described_class.entered_on(from_date: Date.current.beginning_of_year, to_date: Date.current.end_of_year)).to_not include(old_voucher)
    end

    it '.with_entry' do
      entry                 = create(:entry_with_credit_and_debit)
      without_entry_voucher = create(:voucher)
      with_entry_voucher    = create(:voucher, entry: entry)

      expect(described_class.with_entry).to include(with_entry_voucher)
      expect(described_class.with_entry).to_not include(without_entry_voucher)
    end

    it "#with_entry?" do
      entry                 = create(:entry_with_credit_and_debit)
      without_entry_voucher = create(:voucher)
      with_entry_voucher    = create(:voucher, entry: entry)

      expect(with_entry_voucher.with_entry?).to be true
      expect(without_entry_voucher.with_entry?).to be false
    end

    it "#with_entry?" do
      entry                 = create(:entry_with_credit_and_debit)
      without_entry_voucher = create(:voucher)
      with_entry_voucher    = create(:voucher, entry: entry)

      expect(without_entry_voucher.without_entry?).to be true
      expect(with_entry_voucher.without_entry?).to be false
    end
  end
end
