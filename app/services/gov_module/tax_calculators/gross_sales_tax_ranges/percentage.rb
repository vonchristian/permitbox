module GovModule
  module TaxCalculators
    module GrossSalesTaxRanges
      class Percentage
        attr_reader :amount, :gross_sales_tax_range

        def initialize(args)
          @amount = args.fetch(:amount)
          @gross_sales_tax_range = args.fetch(:gross_sales_tax_range)
        end

        def compute
          computation = amount * gross_sales_tax_range.tax_rate
          if computation < gross_sales_tax_range.minimum_tax_amount.to_f
            gross_sales_tax_range.minimum_tax_amount
          else
            computation
          end
        end
      end
    end
  end
end
