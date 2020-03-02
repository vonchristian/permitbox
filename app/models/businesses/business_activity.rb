module Businesses
  class BusinessActivity < ApplicationRecord
    belongs_to :line_of_business
    belongs_to :revenue_account, class_name: 'Accounting::Revenue'
    belongs_to :business
    delegate   :name, :fee_amount, :has_storage_permit_fee?, to: :line_of_business
    validates  :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
    
    def self.not_cancelled
      where(cancelled_at: nil)
    end 

    def self.cancelled
      where.not(cancelled_at: nil)
    end 

    def self.revenue_accounts 
      ids = pluck(:revenue_account_id)
      Accounting::Revenue.where(id: ids.flatten.compact.uniq)
    end 

    def total_fee_amount
      fee_amount * quantity
    end
  end
end
