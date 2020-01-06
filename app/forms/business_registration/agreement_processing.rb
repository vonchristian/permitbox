module BusinessRegistration
  class AgreementProcessing
    include ActiveModel::Model
    attr_accessor :terms_accepted, :cart_id

    def process!
      ActiveRecord::Base.transaction do
        create_agreement
      end
    end
    private
    def create_agreement
      find_cart.update_attributes!(terms_accepted: true)
    end
    def find_cart
      Cart.find_by_id(cart_id)
    end
  end
end
