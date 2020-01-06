require 'rails_helper'

module BusinessTaxCalculators
  describe Amount do
    it 'compute_tax' do
      tax_range = create(:gross_sales_tax_range, tax_type: 'amount', tax_amount: 500)

      expect(described_class.new(gross_sales_tax_range: tax_range, gross_sale_amount: 1000).compute_tax).to eql 500
    end
  end
end
