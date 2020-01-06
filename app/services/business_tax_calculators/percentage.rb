module BusinessTaxCalculators
  class Percentage
    attr_reader :gross_sales_tax_range, :gross_sale_amount

    def initialize(args)
      @gross_sales_tax_range = args.fetch(:gross_sales_tax_range)
      @gross_sale_amount     = args.fetch(:gross_sale_amount)
    end

    def compute_tax
      minimum_tax_amount = gross_sales_tax_range.minimum_tax_amount || 0
      tax = gross_sale_amount * gross_sales_tax_range.tax_rate
      if tax <= minimum_tax_amount
        gross_sales_tax_range.minimum_tax_amount
      else
        tax
      end
    end
  end
end
