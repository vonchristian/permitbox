module Businesses
  class GrossSalesTaxComputation
    attr_reader :gross_sale 

    def initialize(gross_sale:)
      @gross_sale = gross_sale 
    end 

    def compute_tax!
      if gross_sale.essential?
        essential_tax 
      elsif gross_sale.non_essential?
        regular_tax 
      end 
    end 

    private 

    def essential_tax
      regular_tax / 2.0
    end 

    def regular_tax
      find_grossable.business_tax_category.compute_tax(gross_sale.amount)
    end 

    def find_grossable
      if gross_sale.business.present?
        gross_sale.business
      elsif gross_sale.business_permit_application.present?
        gross_sale.business_permit_application
      end
    end
  end 
end 