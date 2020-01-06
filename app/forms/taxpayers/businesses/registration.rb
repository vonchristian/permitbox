module Taxpayers
  module Businesses
    class Registration
      include ActiveModel::Model
      attr_accessor :name,  :capital, :asset_size, :cart_id, :locality_id

      def process!
        ActiveRecord::Base.transaction do
          add_documents
          create_charge_for_capital
          add_charges
        end
      end

      private
      def add_documents
        find_locality.documents.each do |document|
          find_cart.required_documents.find_or_create_by(document: document)
        end
      end

      def find_cart
        Cart.find(cart_id)
      end
      def find_locality
        Locations::Locality.find(locality_id)
      end

      def create_charge_for_capital
        charge = Charge.find_or_create_by(locality: find_locality, name: "Capital Tax", revenue_account: find_locality.capital_tax_revenue_account, amount: 100)
        Vouchers::VoucherAmount.find_or_create_by(name: charge.name,  amountable: find_cart, amount: charge.amount, account: charge.revenue_account)
      end
      def add_charges
        find_locality.charges.each do |charge|
          Vouchers::VoucherAmount.find_or_create_by(name: charge.name,  amountable: find_cart, amount: charge.amount, account: charge.revenue_account)
        end
      end
    end
  end
end
