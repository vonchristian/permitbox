require 'rails_helper'
module Vouchers
  describe VoucherAmount do
    describe 'associations' do
      it { is_expected.to belong_to(:voucher).optional }
      it { is_expected.to belong_to :account }
      it { is_expected.to belong_to :amountable }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :quantity }
      it { is_expected.to validate_numericality_of :quantity }
    end
    describe 'enums' do
      it do
        is_expected.to define_enum_for(:amount_type).
        with_values([:debit, :credit])
      end
    end

    describe '.scopes' do
      it '.without_voucher / .with_voucher' do
        voucher = create(:voucher)
        without_voucher = create(:voucher_amount)
        with_voucher = create(:voucher_amount, voucher: voucher)

        expect(described_class.without_voucher).to include(without_voucher)
        expect(described_class.with_voucher).to include(with_voucher)

      end

      it '.for_account(args={}) / .excluding_account(args={})' do
        revenue = create(:revenue)
        asset = create(:asset)
        revenue_amount = create(:voucher_amount, account: revenue)
        asset_amount = create(:voucher_amount, account: asset)
        expect(described_class.for_account(account: revenue)).to include(revenue_amount)
        expect(described_class.for_account(account: revenue)).to_not include(asset_amount)

        expect(described_class.excluding_account(account: asset)).to_not include(asset_amount)
        expect(described_class.excluding_account(account: revenue)).to_not include(revenue_amount)
      end

      it '.with_non_zero_amounts' do
        zero_amount = create(:voucher_amount, amount: 0)
        non_zero_amount = create(:voucher_amount, amount: 100)

        expect(described_class.with_non_zero_amounts).to include(non_zero_amount)
        expect(described_class.with_non_zero_amounts).to_not include(zero_amount)
      end

      it '.discount_amounts / .non_discount_amounts' do
        revenue = create(:revenue, contra: false)
        contra_revenue = create(:revenue, contra: true)
        non_discount_amount = create(:voucher_amount, account: revenue)
        discount_amount = create(:voucher_amount, account: contra_revenue)

        expect(described_class.discount_amounts).to include(discount_amount)
        expect(described_class.discount_amounts).to_not include(non_discount_amount)

        expect(described_class.non_discount_amounts).to include(non_discount_amount)
        expect(described_class.non_discount_amounts).to_not include(discount_amount)
      end

      it '.total' do
        voucher_amount = create(:voucher_amount, amount: 100)
        another_voucher_amount = create(:voucher_amount, amount: 100)

        expect(described_class.total).to eql 200.0
      end

      it '.total_less_discount' do
        discount_revenue = create(:revenue, contra: true)
        non_discount_revenue = create(:revenue, contra: false)
        voucher_amount = create(:voucher_amount, amount: 1_000, account: non_discount_revenue)
        another_voucher_amount = create(:voucher_amount, amount: 100, account: discount_revenue)

        expect(described_class.total_less_discount).to eql 900.0
      end

    end
  end
end
