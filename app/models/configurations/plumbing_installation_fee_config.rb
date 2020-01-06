module Configurations
  class PlumbingInstallationFeeConfig < ApplicationRecord
    belongs_to :revenue_account, class_name: "Accounting::Account"
    belongs_to :locality,        class_name: "Locations::Locality"
    def self.recent
      order(created_at: :desc).first
    end
  end
end
