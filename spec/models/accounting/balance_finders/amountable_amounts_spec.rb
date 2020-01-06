require 'rails_helper'

module Accounting
  module BalanceFinders
    describe AmountableAmounts do
      it '#compute' do
        entry = build(:entry)
        business = create(:business)
        debit_amount = build(:debit_amount, amount: 100, amountable: business)
        credit_amount = build(:credit_amount, amount: 100, amountable: business)

        another_credit_amount = build(:credit_amount, amount: 100)
        another_debit_amount = build(:debit_amount, amount: 100)


        entry.debit_amounts << debit_amount
        entry.credit_amounts << credit_amount
        entry.debit_amounts << another_debit_amount
        entry.credit_amounts << another_credit_amount

        entry.save!

        expect(described_class.new(amounts: entry.amounts, amountable: business).compute).to eql 200
        expect(described_class.new(amounts: entry.debit_amounts, amountable: business).compute).to eql 100
        expect(described_class.new(amounts: entry.credit_amounts, amountable: business).compute).to eql 100
        expect(Accounting::BalanceFinders::Amounts.new(amounts: entry.amounts).compute).to eql(400)
      end
    end
  end
end
