require 'rails_helper'

module BusinessTaxCalculators
  describe Percentage do
    describe 'compute_tax' do
      it 'less than minimum_tax_amount' do
        tax_range = create(:gross_sales_tax_range, tax_type: 'percentage', tax_rate: 0.01, minimum_tax_amount: 50)

        expect(described_class.new(gross_sales_tax_range: tax_range, gross_sale_amount: 1000).compute_tax).to eql 50
      end

      it 'more than minimum_tax_amount' do
        tax_range = create(:gross_sales_tax_range, tax_type: 'percentage', tax_rate: 0.1, minimum_tax_amount: 50)

        expect(described_class.new(gross_sales_tax_range: tax_range, gross_sale_amount: 1_000).compute_tax).to eql 100
        expect(described_class.new(gross_sales_tax_range: tax_range, gross_sale_amount: 10_000).compute_tax).to eql 1_000

      end
    end
  end
end
