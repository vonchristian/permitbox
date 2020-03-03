module Businesses 
  class BusinessCharge < ApplicationRecord
    belongs_to :business
    belongs_to :revenue_account, class_name: 'Accounting::Revenue'
    belongs_to :charge 

    delegate :name, :amount, to: :charge, prefix: true

    def self.not_cancelled
      where(cancelled_at: nil)
    end 

    def self.cancelled
      where.not(cancelled_at: nil)
    end
  end
end 