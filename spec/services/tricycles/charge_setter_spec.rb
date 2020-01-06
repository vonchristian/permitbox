require 'rails_helper'

module Tricycles
  describe ChargeSetter do
    it 'set_charges!' do
      locality = create(:locality)
      tricycle = create(:tricycle, locality: locality)
      charge   = create(:charge, locality: locality, name: 'Filing Fee', charge_scope: 'for_tricycle')
      cart     = create(:cart)

      described_class.new(tricycle: tricycle, cart: cart).set_charges!

      expect(cart.voucher_amounts.pluck(:account_id)).to include(charge.revenue_account_id)
    end
  end
end
