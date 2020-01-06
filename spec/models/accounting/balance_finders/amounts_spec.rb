require 'rails_helper'

module Accounting
  module BalanceFinders
    describe Amounts do
      it '#compute' do
        entry = build(:entry)
        debit_amount = build(:debit_amount, amount: 100)
        credit_amount = build(:credit_amount, amount: 100)
        entry.debit_amounts << debit_amount
        entry.credit_amounts << credit_amount
        entry.save!

        expect(described_class.new(amounts: entry.amounts).compute).to eql 200
        expect(described_class.new(amounts: entry.debit_amounts).compute).to eql 100
        expect(described_class.new(amounts: entry.credit_amounts).compute).to eql 100

      end
    end
  end
end
