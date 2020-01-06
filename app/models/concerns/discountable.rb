module Discountable
  extend ActiveSupport::Concern

  included do
    has_many :discountable_discounts, as: :discountable, dependent: :destroy
    has_many :discounts, through: :discountable_discounts
  end
end
