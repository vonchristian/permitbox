require 'rails_helper'

module BusinessTaxCategories
  describe GrossSalesTaxRange do
    describe 'associations' do
      it { is_expected.to belong_to :locality }
      it { is_expected.to belong_to :business_tax_category }
    end

    it { is_expected.to define_enum_for(:tax_type).with_values([:amount, :percentage, :percentage_with_tax_on_excess]) }
    
    it '#range' do 
      tax_range = build(:gross_sales_tax_range, minimum_gross_sale: 0, maximum_gross_sale: 10_000)

      expect(tax_range.range).to eq 0..10_000
    end 

    describe "#tax_calculator" do
      it '#returns amount' do
        amount = create(:gross_sales_tax_range, tax_type: 'amount')

        expect(amount.tax_calculator).to eql BusinessTaxCalculators::Amount
      end

      it '#returns percentage' do
        amount = create(:gross_sales_tax_range, tax_type: 'percentage')

        expect(amount.tax_calculator).to eql BusinessTaxCalculators::Percentage
      end

      it '#returns percentage_with_tax_on_excess' do
        amount = create(:gross_sales_tax_range, tax_type: 'percentage_with_tax_on_excess')

        expect(amount.tax_calculator).to eql BusinessTaxCalculators::PercentageWithTaxOnExcess
      end
    end
  end
end
