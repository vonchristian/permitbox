module GovModule
  module Businesses
    class GrossSaleProcessing
      include ActiveModel::Model
      attr_accessor :amount, :calendar_year, :business_id, :essential
      validates :amount, :calendar_year, presence: true
      validates :amount, numericality: true
      def process!
        ActiveRecord::Base.transaction do
          create_gross_sale
        end
      end

      private
      def create_gross_sale
        gross_sale = find_business.gross_sales.create!(
        calendar_year: calendar_year,
        amount:        amount)

        create_charge(gross_sale)
        create_discount(gross_sale)
      end

      def find_business
        Business.find(business_id)
      end

      def create_charge(gross_sale)
        ChargeCalculators::BusinessTax.new(
          charge_name: "Business Tax",
          business_tax_amount: find_business.business_tax_category.compute_tax(gross_sale.amount),
          chargeable: find_business,
          revenue_account: find_business.business_tax_category.revenue_account,
        ).calculate_charge
      end
      def create_discount(gross_sale)
        BusinessDiscountSetter.new(
          discountable: find_business,
        ).set_discounts
      end
    end
  end
end
