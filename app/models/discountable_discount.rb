class DiscountableDiscount < ApplicationRecord
  belongs_to :discountable, polymorphic: true
  belongs_to :discount
end
