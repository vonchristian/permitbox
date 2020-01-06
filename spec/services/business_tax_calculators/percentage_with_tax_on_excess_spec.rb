require 'rails_helper'

module BusinessTaxCalculators
  describe PercentageWithTaxOnExcess do
    describe 'compute_tax' do
      it 'less than minimum_tax_amount' do
        tax_range = create(:gross_sales_tax_range, tax_type: 'percentage_with_tax_on_excess', gross_limit: 50_000, tax_rate_for_excess: 0.2, tax_amount: 3000, minimum_tax_amount: 6000)

        expect(described_class.new(gross_sales_tax_range: tax_range, gross_sale_amount: 60_000).compute_tax).to eql 6000
      end

      it 'more than minimum_tax_amount' do
        tax_range = create(:gross_sales_tax_range, tax_type: 'percentage_with_tax_on_excess', gross_limit: 50_000, tax_rate_for_excess: 0.5, tax_amount: 3000, minimum_tax_amount: 6000)

        expect(described_class.new(gross_sales_tax_range: tax_range, gross_sale_amount: 60_000).compute_tax).to eql 8_000
      end
    end
  end
end
