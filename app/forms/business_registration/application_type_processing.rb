module BusinessRegistration
  class ApplicationTypeProcessing
    include ActiveModel::Model
    attr_accessor :cart_id, :application_type

    def process!
      ActiveRecord::Base.transaction do
        set_application_type
      end
    end

    private

    def set_application_type
      find_cart.update_attributes!(application_type: application_type)
    end
    def find_cart
      Cart.find(cart_id)
    end
  end
end
