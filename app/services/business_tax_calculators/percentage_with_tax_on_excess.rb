module BusinessTaxCalculators
  class PercentageWithTaxOnExcess
    attr_reader :gross_sales_tax_range, :gross_sale_amount, :minimum_tax_amount

    def initialize(args)
      @gross_sales_tax_range = args.fetch(:gross_sales_tax_range)
      @gross_sale_amount     = args.fetch(:gross_sale_amount)
      @minimum_tax_amount = @gross_sales_tax_range.minimum_tax_amount
    end

    def compute_tax
      if computed_tax <= minimum_tax_amount
        minimum_tax_amount
      else
        computed_tax
      end
    end


    private 
    
    def computed_tax
      tax_on_gross_limit + tax_on_excess
    end 


    def tax_on_gross_limit
      gross_sales_tax_range.gross_limit * gross_sales_tax_range.tax_rate
    end

    def tax_on_excess
      excess * gross_sales_tax_range.tax_rate_for_excess
    end
    def excess
      gross_sale_amount - gross_sales_tax_range.gross_limit
    end
  end
end
