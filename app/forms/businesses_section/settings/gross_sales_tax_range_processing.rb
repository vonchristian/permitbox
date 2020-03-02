module BusinessesSection
  module Settings
    class GrossSalesTaxRangeProcessing
      include ActiveModel::Model
      attr_accessor :minimum_gross_sale, :maximum_gross_sale, :tax_amount, :business_tax_category_id, :locality_id

      def process!
        ActiveRecord::Base.transaction do
          create_charge
        end
      end

      private
      def create_charge
        gross_sales_tax_range = find_business_tax_category.gross_sales_tax_ranges.create!(
          minimum_gross_sale: minimum_gross_sale,
          maximum_gross_sale: maximum_gross_sale,
          charge: charge)
      end

      def find_business_tax_category
        BusinessTaxCategory.find_by_id(business_tax_category_id)
      end
    end
  end
end
