class BusinessDiscountSetter
  attr_reader :discountable
  def initialize(args)
    @discountable = args.fetch(:discountable)
  end

  def set_discounts
    discountable.discounts.each do |discount|
      create_discount(discount)
    end
  end
  private
  def create_discount(discount)
    discountable.voucher_amounts.create!(
    name:    discount.name,
    amount:  discount.discount_amount(discountable),
    account: discount.discount_account)
  end
end
