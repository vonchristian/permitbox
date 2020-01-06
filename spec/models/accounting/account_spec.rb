require "rails_helper"

module Accounting
  describe Account do
    describe 'associations' do
      it { is_expected.to have_many :amounts }
      it { is_expected.to have_many :credit_amounts }
      it { is_expected.to have_many :debit_amounts }
      it { is_expected.to have_many :entries }
      it { is_expected.to have_many :debit_entries }
      it { is_expected.to have_many :credit_entries }
      it { is_expected.to have_many :account_budgets }
      it { is_expected.to have_many :subsidiary_accounts }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :type }
      it { is_expected.to validate_presence_of :code }
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of(:code).case_insensitive }
      it { is_expected.to validate_uniqueness_of(:name) }
    end

    describe 'scopes' do
      it '.account types' do
        asset     = create(:asset)
        liability = create(:liability)
        equity    = create(:equity)
        revenue   = create(:revenue)
        expense   = create(:expense)

        expect(described_class.assets).to include(asset)
        expect(described_class.assets).to_not include(liability)
        expect(described_class.assets).to_not include(equity)
        expect(described_class.assets).to_not include(revenue)
        expect(described_class.assets).to_not include(expense)

        expect(described_class.liabilities).to include(liability)
        expect(described_class.liabilities).to_not include(asset)
        expect(described_class.liabilities).to_not include(equity)
        expect(described_class.liabilities).to_not include(revenue)
        expect(described_class.liabilities).to_not include(expense)

        expect(described_class.equities).to include(equity)
        expect(described_class.equities).to_not include(asset)
        expect(described_class.equities).to_not include(liability)
        expect(described_class.equities).to_not include(revenue)
        expect(described_class.equities).to_not include(expense)

        expect(described_class.revenues).to include(revenue)
        expect(described_class.revenues).to_not include(asset)
        expect(described_class.revenues).to_not include(equity)
        expect(described_class.revenues).to_not include(liability)
        expect(described_class.revenues).to_not include(expense)

        expect(described_class.expenses).to include(expense)
        expect(described_class.expenses).to_not include(asset)
        expect(described_class.expenses).to_not include(equity)
        expect(described_class.expenses).to_not include(liability)
        expect(described_class.expenses).to_not include(revenue)
      end

      it '.active / .inactive' do
        active_account   = create(:asset, active: true)
        inactive_account = create(:asset, active: false)

        expect(described_class.active).to include(active_account)
        expect(described_class.active).to_not include(inactive_account)

        expect(described_class.inactive).to include(inactive_account)
        expect(described_class.inactive).to_not include(active_account)
      end

      it '.updated_at(args={})' do
        recent_account = create(:asset, last_transaction_date: Date.current)
        old_account    = create(:asset, last_transaction_date: Date.current.last_year)

        expect(described_class.updated_at(from_date: Date.current.beginning_of_year, to_date: Date.current.end_of_year)).to include(recent_account)
        expect(described_class.updated_at(from_date: Date.current.beginning_of_year, to_date: Date.current.end_of_year)).to_not include(old_account)
      end

      it 'updated_by(employee)' do
        employee = create(:user)
        entry    = build(:entry, recorder: employee)
        asset    = create(:asset)
        revenue  = create(:revenue)
        equity   = create(:equity)
        entry.debit_amounts.build(account: asset, amountable: employee)
        entry.credit_amounts.build(account: revenue, amountable: employee)
        entry.save!

        expect(described_class.updated_by(employee)).to include(asset)
        expect(described_class.updated_by(employee)).to include(revenue)
        expect(described_class.updated_by(employee)).to_not include(equity)
      end
    end
    it '#normalized_type' do
      asset   = build(:asset)
      revenue = build(:revenue)

      expect(asset.normalized_type).to eql 'Asset'
      expect(revenue.normalized_type).to eql 'Revenue'
    end

    describe ".trial_balance" do
      subject { described_class.trial_balance }
      it { is_expected.to be_kind_of BigDecimal }

      context "when given no entries" do
        it { is_expected.to eql 0 }
      end

      context "when given correct entries" do
        before {
          # credit accounts
          liability      = create(:liability)
          equity         = create(:equity)
          revenue        = create(:revenue)
          contra_asset   = create(:asset, :contra => true)
          contra_expense = create(:expense, :contra => true)
          # credit amounts
          ca1 = build(:credit_amount, :account => liability, :amount => 100000)
          ca2 = build(:credit_amount, :account => equity, :amount => 1000)
          ca3 = build(:credit_amount, :account => revenue, :amount => 40404)
          ca4 = build(:credit_amount, :account => contra_asset, :amount => 2)
          ca5 = build(:credit_amount, :account => contra_expense, :amount => 333)

          # debit accounts
          asset            = create(:asset)
          expense          = create(:expense)
          contra_liability = create(:liability, :contra => true)
          contra_equity    = create(:equity, :contra => true)
          contra_revenue   = create(:revenue, :contra => true)
          # debit amounts
          da1 = build(:debit_amount, :account => asset, :amount => 100000)
          da2 = build(:debit_amount, :account => expense, :amount => 1000)
          da3 = build(:debit_amount, :account => contra_liability, :amount => 40404)
          da4 = build(:debit_amount, :account => contra_equity, :amount => 2)
          da5 = build(:debit_amount, :account => contra_revenue, :amount => 333)

          create(:entry, :credit_amounts => [ca1], :debit_amounts => [da1])
          create(:entry, :credit_amounts => [ca2], :debit_amounts => [da2])
          create(:entry, :credit_amounts => [ca3], :debit_amounts => [da3])
          create(:entry, :credit_amounts => [ca4], :debit_amounts => [da4])
          create(:entry, :credit_amounts => [ca5], :debit_amounts => [da5])

        }
        it { is_expected.to eql 0 }
      end
    end
  end
end
