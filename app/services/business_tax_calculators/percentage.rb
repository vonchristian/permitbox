module BusinessTaxCalculators
  class Percentage
    attr_reader :gross_sales_tax_range, :gross_sale_amount, :minimum_tax_amount

    def initialize(gross_sales_tax_range:, gross_sale_amount:)
      @gross_sales_tax_range = gross_sales_tax_range
      @gross_sale_amount     = gross_sale_amount
      @minimum_tax_amount    = @gross_sales_tax_range.minimum_tax_amount||0
    end

    def compute_tax
      tax  = gross_sale_amount * gross_sales_tax_range.tax_rate
      
      if tax <= minimum_tax_amount
        minimum_tax_amount
      else
        tax
      end
    end
  end
end
