module BusinessTaxCalculators
  class Amount
    attr_reader :gross_sales_tax_range, :gross_sales_amount, :tax_amount
    
    def initialize(gross_sales_tax_range:, gross_sale_amount:)
      @gross_sales_tax_range = gross_sales_tax_range
      @gross_sale_amount     = gross_sale_amount
      @tax_amount            = @gross_sales_tax_range.tax_amount
    end

    def compute_tax
      tax_amount
    end
  end
end
