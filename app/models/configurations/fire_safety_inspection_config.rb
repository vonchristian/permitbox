module Configurations
  class FireSafetyInspectionConfig < ApplicationRecord
    belongs_to :locality,          class_name: "Locations::Locality"
    belongs_to :liability_account, class_name: "Accounting::Account"

    def self.recent
      order(created_at: :desc).first
    end

    def compute_fee(business)
       amount_for(business) * rate
    end

    def amount_for(business)
      business.voucher_amounts.where(account_id: accounts).sum(&:amount)
    end
  end
end
