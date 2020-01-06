module GovModule
  class ChargeProcessing
    include ActiveModel::Model
    attr_accessor :charge_id, :cart_id, :locality_id
    def process!
      ActiveRecord::Base.transaction do
        create_charge
      end
    end

    private
    def create_charge
      find_cart.voucher_amounts.credit.create(
        name: find_charge.name,
        amount: find_charge.amount,
        account: find_charge.revenue_account
      )
    end

    def find_cart
      Cart.find(cart_id)
    end
    def find_charge
      find_locality.charges.find(charge_id)
    end

    def find_locality
      Locations::Locality.find(locality_id)
    end
  end
end
