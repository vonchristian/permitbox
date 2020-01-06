module BusinessRegistration
  class OwnershipTypeProcessing
    include ActiveModel::Model
    attr_accessor :cart_id, :ownership_type_id
    validates :cart_id, :ownership_type_id, presence: true

    def process!
      ActiveRecord::Base.transaction do
        set_ownership_type
      end
    end

    private
    def set_ownership_type
      find_cart.update_attributes!(ownership_type_id: ownership_type_id)
    end
    def find_cart
      Cart.find(cart_id)
    end
  end
end
