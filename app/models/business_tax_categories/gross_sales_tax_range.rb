module BusinessTaxCategories
  class GrossSalesTaxRange < ApplicationRecord
    enum tax_type: [:amount, :percentage, :percentage_with_tax_on_excess]
    belongs_to :locality, class_name: "Locations::Locality"
    belongs_to :business_tax_category

    def range
      minimum_gross_sale..maximum_gross_sale
    end
    
    def tax_calculator
      ("BusinessTaxCalculators::" + tax_type.titleize.gsub(" ", "")).constantize
    end
  end
end
