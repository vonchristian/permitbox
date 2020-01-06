module GovModule
  module TaxCalculators
    module GrossSalesTaxRanges
      class Amount
        attr_reader :amount, :gross_sales_tax_range

        def initialize(args)
          @amount                = args.fetch(:amount)
          @gross_sales_tax_range = args.fetch(:gross_sales_tax_range)
        end

        def compute
          gross_sales_tax_range.tax_amount
        end
      end
    end
  end
end
