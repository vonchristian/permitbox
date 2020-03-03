module ChargeCalculators
  class BusinessTax
    attr_reader :business_permit_application, :gross_sale, :business,  :cart
    def initialize(args)
    
      @gross_sale                  = args[:gross_sale]
      @cart                        = args[:cart]
      @business                    = @gross_sale.business


    end
    def create_charges!
      cart.voucher_amounts.credit.create!(
      name:    "Business Tax (#{gross_sale.gross_sale_type.titleize})",
      amount:  gross_sale.business_tax,
      account: business.tax_revenue_account)
    end
  end
end
