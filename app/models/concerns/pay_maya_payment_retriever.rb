class PayMayaPaymentRetriever
  attr_reader :payee
  def initialize(payee)
    @payee = payee
  end
  def retrieve
    Paymaya::Checkout::Checkout.retrieve(payee.checkout_id)
  end
end
