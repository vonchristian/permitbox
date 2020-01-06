module GovModule
  module TaxCalculators
    module GrossSalesTaxRanges
      class PercentageWithTaxOnExcess
        def initialize(args)
          @amount                = args.fetch(:amount)
          @gross_sales_tax_range = args.fetch(:gross_sales_tax_range)
        end

        def compute
          gross_sales_tax_range.gross_limit * gross_sales_tax_range.rate
          + tax_on_excess
        end
        def tax_on_excess
          excess_gross_sale * gross_sales_tax_range.tax_on_excess
        end
        def excess_gross_sale
          amount - gross_sales_tax_range - gross_sales_tax_range.gross_limit
        end
      end
    end
  end
end
