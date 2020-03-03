require 'rails_helper'

module Businesses 
  describe GrossSalesTaxComputation do 
    it "compute_tax!" do 
      business_tax_category = create(:business_tax_category)
      gross_sales_tax_range = create(:gross_sales_tax_range, business_tax_category: business_tax_category, tax_type: 'percentage', tax_rate: 0.02, minimum_gross_sale: 0, maximum_gross_sale: 1_000_000)
      business              = create(:business, business_tax_category: business_tax_category)
      essential             = create(:gross_sale, business: business, gross_sale_type: 'essential', amount: 100_000)
      non_essential         = create(:gross_sale, business: business, gross_sale_type: 'non_essential', amount: 100_000)

     expect(described_class.new(gross_sale: essential).compute_tax!).to eql 1_000
     expect(described_class.new(gross_sale: non_essential).compute_tax!).to eql 2_000
    end 
  end 
end 