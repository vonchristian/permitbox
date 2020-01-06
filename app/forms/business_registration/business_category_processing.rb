module BusinessRegistration
  class BusinessCategoryProcessing
    include ActiveModel::Model
    attr_accessor :cart_id, :business_tax_category_id, :locality_id
    def process!
      ActiveRecord::Base.transaction do
        set_business_category
        set_default_charges
      end
    end

    private
    def set_business_category
      find_cart.update_attributes!(business_tax_category_id: business_tax_category_id)
    end
    def set_default_charges
      find_locality.charges.default.each do |charge|
        find_cart.voucher_amounts.create(
          amount: charge.amount,
          name: charge.name,
          account: charge.revenue_account)
      end
    end
    def find_cart
      Cart.find_by_id(cart_id)
    end
    def find_locality
      Locations::Locality.find(locality_id)
    end
  end
end
