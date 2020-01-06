module BusinessTaxCalculators
  class Amount
    attr_reader :gross_sales_tax_range, :gross_sales_amount
    def initialize(args)
      @gross_sales_tax_range = args.fetch(:gross_sales_tax_range)
      @gross_sale_amount     = args.fetch(:gross_sale_amount)
    end

    def compute_tax
      gross_sales_tax_range.tax_amount
    end
  end
end
