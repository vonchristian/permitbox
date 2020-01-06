module Configurations
  class DocumentaryStampTaxConfig < ApplicationRecord
    belongs_to :revenue_account, class_name: "Accounting::Account"
    belongs_to :locality,        class_name: "Locations::Locality"
    def self.recent
      order(created_at: :desc).first
    end
    def self.compute_fee(chargeable)
      ids = chargeable.voucher_amounts.pluck(:account_id)
    end
  end
end
