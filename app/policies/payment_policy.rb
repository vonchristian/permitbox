class PaymentPolicy
  attr_reader :user, :voucher
  def initialize(user, voucher)
    @user = user
    @voucher = voucher
  end
  def new?
    user.collection_officer? && voucher.unpaid?
  end
end
