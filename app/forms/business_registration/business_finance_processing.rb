module BusinessRegistration
  class BusinessFinanceProcessing
    include ActiveModel::Model
    attr_accessor :cart_id, :asset_size, :capital, :locality_id, :gross_sale, :calendar_year, :taxpayer_id
    validates :gross_sale, :capital, :asset_size, numericality: true

    def process!
      ActiveRecord::Base.transaction do
        create_asset_size
      end
    end

    private
    def create_asset_size
      find_cart.update_attributes!(
        asset_size: asset_size,
        capital: capital)
      find_cart.gross_sales.create(amount: gross_sale, calendar_year: calendar_year)
    end
    def find_cart
      Cart.find(cart_id)
    end
  end
end
