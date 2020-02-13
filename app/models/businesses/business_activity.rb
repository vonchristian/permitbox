module Businesses
  class BusinessActivity < ApplicationRecord
    belongs_to :line_of_business
    belongs_to :revenue_account, class_name: 'Accounting::Revenue'
    belongs_to :business, optional: true
    belongs_to :business_permit_application, optional: true
    delegate   :name, :has_storage_permit_fee?, to: :line_of_business
    validates  :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }

    def fee_amount
      line_of_business.fee_amount * quantity
    end
  end
end
