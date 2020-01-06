module Configurations
  class AnnualInspectionFeeConfig < ApplicationRecord
    belongs_to :locality, class_name: "Locations::Locality"
    belongs_to :revenue_account, class_name: "Accounting::Account"
    def self.recent
      order(created_at: :desc).first
    end
  end
end
