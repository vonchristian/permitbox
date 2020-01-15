module Configurations
  class FireSafetyInspectionConfig < ApplicationRecord
    belongs_to :locality,          class_name: "Locations::Locality"
    belongs_to :liability_account, class_name: "Accounting::Account"
    has_many :fire_safety_inspection_accounts
    has_many :accounts, through: :fire_safety_inspection_accounts, class_name: 'Accounting::Account'
    
    delegate :name, to: :locality, prefix: true
    def self.recent
      order(created_at: :desc).first
    end

    def compute_fee(voucher)
       computed_amount = amount_for(voucher) * rate
      #  if computed_amount > minimum_amount
      #     computed_amount 
      #  else 
      #   minimum_amount
      #  end
    end

    def amount_for(voucher)
      voucher.voucher_amounts.where(account_id: accounts.ids).total
    end
  end
end
