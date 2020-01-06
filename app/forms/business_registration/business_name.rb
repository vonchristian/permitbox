module BusinessRegistration
  class BusinessName
    include ActiveModel::Model
    attr_accessor :name, :cart_id, :taxpayer_id, :locality_id

    def find_taxpayer
      Taxpayer.find(taxpayer_id)
    end
    def find_locality
      Locations::Locality.find(locality_id)
    end

    def register!
      ActiveRecord::Base.transaction do
        create_business_name
      end
    end

    private
    def create_business_name
      find_cart.update_attributes!(name: name)
    end
    def find_cart
      Cart.find(cart_id)
    end
  end
end
