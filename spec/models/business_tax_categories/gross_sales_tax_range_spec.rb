require 'rails_helper'

module BusinessTaxCategories
  describe GrossSalesTaxRange do
    describe 'associations' do
      it { is_expected.to belong_to :locality }
      it { is_expected.to belong_to :business_tax_category }
    end

    describe "#tax_calculator" do
      it 'returns amount' do
        amount = described_class.create(tax_type: 'amount')

        expect(amount.tax_calculator).to eql BusinessTaxCalculators::Amount
      end

      it 'returns percentage' do
        amount = described_class.create(tax_type: 'percentage')

        expect(amount.tax_calculator).to eql BusinessTaxCalculators::Percentage
      end

      it 'returns percentage_with_tax_on_excess' do
        amount = described_class.create(tax_type: 'percentage_with_tax_on_excess')

        expect(amount.tax_calculator).to eql BusinessTaxCalculators::PercentageWithTaxOnExcess
      end
    end
  end
end
